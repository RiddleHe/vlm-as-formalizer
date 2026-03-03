#!/usr/bin/env python

import argparse
import json
import re
import traceback
from datetime import datetime
from pathlib import Path

from dotenv import load_dotenv
from tqdm import tqdm

from utils.checkers import check_error, check_pddl, compare_plans
from utils.generate import (
    SUPPORTED_ROUTES,
    generate_pddl,
    normalize_route_name,
)
from utils.helpers import load_problem_data, seed_everything
from utils.models import VLMClientFactory


DATASET_ALIASES = {
    "alfred": "alfred_multi",
    "alfred_multi": "alfred_multi",
    "blocksworld": "blocksworld_real",
    "blocksworld-real": "blocksworld_real",
    "blocksworld_real": "blocksworld_real",
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Run a single baseline route on a dataset and report evaluation stats."
    )
    parser.add_argument(
        "--route",
        required=True,
        help=f"One route to execute. Supported: {', '.join(SUPPORTED_ROUTES)}",
    )
    parser.add_argument(
        "--dataset",
        default=None,
        help="Dataset name under data/ (e.g. alfred_multi) or full dataset path.",
    )
    parser.add_argument(
        "--domain",
        default=None,
        help="Deprecated alias of --dataset.",
    )

    parser.add_argument("--model", required=True, help="Model name (OpenAI or HF identifier).")
    parser.add_argument("--device", default="cuda:0", help="Device hint for non-OpenAI models.")

    parser.add_argument("--output_root", default=None, help="Root output directory. Defaults to <repo>/results")
    parser.add_argument("--run_name", default=None, help="Optional run name. Defaults to timestamp.")

    parser.add_argument("--seed", type=int, default=42, help="Random seed.")
    parser.add_argument("--num_tries", type=int, default=3, help="Number of generation attempts per task.")
    parser.add_argument("--task_offset", type=int, default=0, help="Skip the first N tasks.")
    parser.add_argument("--task_limit", type=int, default=None, help="Evaluate at most N tasks.")

    parser.add_argument("--enable_caption", action="store_true", default=False)
    parser.add_argument("--clean_image", action="store_true", default=False)

    parser.add_argument("--hard_template", action="store_true", default=True)
    parser.add_argument("--soft_template", dest="hard_template", action="store_false")

    parser.add_argument("--batch_relations", action="store_true", default=True)
    parser.add_argument("--no-batch_relations", dest="batch_relations", action="store_false")

    parser.add_argument(
        "--validate_with_planner",
        action="store_true",
        default=False,
        help="Run Fast Downward validation in addition to PDDL semantic checks.",
    )
    parser.add_argument("--downward_dir", type=str, default="/home/mh3897/pddl/villain/downward")
    parser.add_argument("--time_limit", type=int, default=30)

    return parser.parse_args()


def _sanitize_component(text: str) -> str:
    safe = re.sub(r"[^A-Za-z0-9._-]+", "-", text.strip())
    return safe.strip("-") or "run"


def _resolve_dataset_path(dataset_arg: str, data_root: Path) -> tuple[Path, str]:
    candidate = DATASET_ALIASES.get(dataset_arg, dataset_arg)

    explicit = Path(candidate)
    if explicit.exists() and explicit.is_dir():
        return explicit.resolve(), explicit.name

    local = data_root / candidate
    if local.exists() and local.is_dir():
        return local.resolve(), local.name

    raise ValueError(
        f"Dataset '{dataset_arg}' not found. "
        f"Use one of {sorted(DATASET_ALIASES.keys())} or pass a valid path."
    )


def _discover_tasks(dataset_path: Path) -> list[str]:
    required_files = {"instruction.txt", "domain.pddl", "plan.txt"}
    tasks = []
    for child in sorted(dataset_path.iterdir()):
        if not child.is_dir():
            continue
        if all((child / fname).exists() for fname in required_files):
            tasks.append(child.name)
    return tasks


def _load_config(dataset_path: Path) -> dict:
    config_path = dataset_path / "config.json"
    if config_path.exists():
        with open(config_path, "r", encoding="utf-8") as f:
            return json.load(f)
    return {}


def _write_text(path: Path, text: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(text)


def _save_attempts(task_dir: Path, result: dict):
    attempts = result.get("attempts", [])
    final_index = result.get("final_index", -1)
    kind = result.get("kind", "")

    for idx, attempt in enumerate(attempts):
        suffix = "" if idx == final_index else f"-try-{idx}"

        if kind == "plan":
            _write_text(task_dir / f"plan{suffix}.txt", attempt.get("plan", ""))
        else:
            _write_text(task_dir / f"problem{suffix}.pddl", attempt.get("problem", ""))

        _write_text(task_dir / f"prompt{suffix}.txt", attempt.get("prompt", ""))
        _write_text(task_dir / f"response{suffix}.txt", attempt.get("response", ""))

        error = attempt.get("error", "")
        if error:
            _write_text(task_dir / f"error{suffix}.txt", error)

    with open(task_dir / "generation_summary.json", "w", encoding="utf-8") as f:
        json.dump(result, f, indent=2)


def _infer_compare_domain(dataset_name: str) -> str:
    if "alfred" in dataset_name.lower():
        return "alfred"
    return "blocksworld"


def main():
    repo_root = Path(__file__).resolve().parents[1]
    load_dotenv(repo_root / ".env")

    args = parse_args()
    seed_everything(args.seed)

    route = normalize_route_name(args.route)
    dataset_arg = args.dataset or args.domain
    if not dataset_arg:
        raise ValueError("One of --dataset or --domain must be provided.")

    dataset_path, dataset_name = _resolve_dataset_path(dataset_arg, repo_root / "data")
    task_names = _discover_tasks(dataset_path)

    if args.task_offset > 0:
        task_names = task_names[args.task_offset :]
    if args.task_limit is not None:
        task_names = task_names[: args.task_limit]

    if not task_names:
        raise ValueError(f"No valid tasks found in dataset: {dataset_path}")

    config = _load_config(dataset_path)

    output_root = Path(args.output_root) if args.output_root else repo_root / "results"
    run_name = args.run_name or datetime.now().strftime("%Y%m%d_%H%M%S")
    result_dir = (
        output_root
        / dataset_name
        / route
        / _sanitize_component(args.model)
        / _sanitize_component(run_name)
    )
    result_dir.mkdir(parents=True, exist_ok=True)

    print("=" * 80)
    print("Experiment configuration")
    print("=" * 80)
    print(f"Route: {route}")
    print(f"Dataset: {dataset_path}")
    print(f"Model: {args.model}")
    print(f"Tasks: {len(task_names)}")
    print(f"Results: {result_dir}")
    print("=" * 80)

    model = VLMClientFactory(args.model, args.device)
    compare_domain = _infer_compare_domain(dataset_name)

    metrics = {
        "tasks_total": len(task_names),
        "generation_success": 0,
        "generation_failure": 0,
        "task_exceptions": 0,
        "pddl_valid": 0,
        "planner_success": 0,
        "plan_match_success": 0,
    }

    for task_name in tqdm(task_names, desc="Running tasks"):
        task_dir = result_dir / task_name
        task_dir.mkdir(parents=True, exist_ok=True)

        try:
            problem_data = load_problem_data(
                str(dataset_path),
                task_name,
                enable_caption=args.enable_caption,
                clean_image=args.clean_image,
            )

            target = {
                "problem": None,
                "response": None,
                "observations": problem_data["observations"],
                "instruction": problem_data["instruction"],
                "domain": problem_data["domain_file"],
                "domain_path": problem_data["domain_path"],
                "plan": problem_data["plan"],
                "error": None,
            }

            result, success = generate_pddl(
                target,
                config,
                model=model,
                args=args,
            )
            _save_attempts(task_dir, result)

            if success:
                metrics["generation_success"] += 1
            else:
                metrics["generation_failure"] += 1

            final = result.get("final", {})
            kind = result.get("kind")

            if kind == "pddl":
                final_problem = (final.get("problem") or "").strip()
                if final_problem:
                    is_valid, msg = check_pddl(final_problem, target["domain"])
                    if is_valid:
                        metrics["pddl_valid"] += 1
                        _write_text(task_dir / "pddl_validation.txt", "valid\n")
                    else:
                        _write_text(task_dir / "pddl_validation.txt", f"invalid\n{msg or ''}\n")

                    if args.validate_with_planner:
                        planner_ok, planner_msg = check_error(
                            final_problem,
                            target["domain"],
                            args.downward_dir,
                            args.time_limit,
                        )
                        if planner_ok:
                            metrics["planner_success"] += 1
                            _write_text(task_dir / "planner_validation.txt", "solved\n")
                        else:
                            _write_text(
                                task_dir / "planner_validation.txt",
                                f"failed\n{planner_msg or ''}\n",
                            )

            elif kind == "plan":
                pred_plan_text = final.get("plan", "")
                pred_plan_lines = pred_plan_text.splitlines()
                gt_plan_lines = target["plan"].splitlines()

                plan_ok, plan_msg = compare_plans(gt_plan_lines, pred_plan_lines, compare_domain)
                if plan_ok:
                    metrics["plan_match_success"] += 1
                    _write_text(task_dir / "plan_validation.txt", "matched\n")
                else:
                    _write_text(task_dir / "plan_validation.txt", f"mismatch\n{plan_msg or ''}\n")

        except Exception:
            metrics["task_exceptions"] += 1
            metrics["generation_failure"] += 1
            _write_text(task_dir / "exception_traceback.txt", traceback.format_exc())

    with open(result_dir / "metrics.json", "w", encoding="utf-8") as f:
        json.dump(metrics, f, indent=2)

    total = metrics["tasks_total"]
    gen_rate = metrics["generation_success"] / total if total else 0.0

    print("\n" + "=" * 80)
    print("Final metrics")
    print("=" * 80)
    print(f"Generation success: {metrics['generation_success']}/{total} ({gen_rate:.2%})")
    print(f"Generation failure: {metrics['generation_failure']}")
    print(f"Task exceptions: {metrics['task_exceptions']}")
    print(f"PDDL valid tasks: {metrics['pddl_valid']}")
    if args.validate_with_planner:
        print(f"Planner success: {metrics['planner_success']}")
    print(f"Plan match success: {metrics['plan_match_success']}")
    print(f"Output: {result_dir}")
    print("=" * 80)


if __name__ == "__main__":
    main()
