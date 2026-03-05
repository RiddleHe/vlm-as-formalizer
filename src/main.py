#!/usr/bin/env python

import argparse
import csv
import json
import os
import re
import sys
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
from utils.models import VLMClientFactory, resolve_model_name

sys.path.insert(0, str(Path(__file__).resolve().parent))
from eval.check_plans import iter_dir as check_plans_iter_dir
from eval.calculate_precision_recall import (
    eval_task as pr_eval_task,
    build_summary as pr_build_summary,
    load_mapping_index,
    merge_reports,
)


DATASET_ALIASES = {
    "alfred": "alfred_multi",
    "alfred_multi": "alfred_multi",
    "blocksworld": "blocksworld_real",
    "blocksworld-real": "blocksworld_real",
    "blocksworld_real": "blocksworld_real",
    "blocksworld-sim": "blocksworld_sim",
    "blocksworld_sim": "blocksworld_sim",
}


def parse_args():
    parser = argparse.ArgumentParser(
        description="Run a single baseline route on a dataset and report evaluation stats."
    )
    parser.add_argument(
        "--route",
        default=None,
        help=f"Route to execute (or 'all' for all routes). Supported: {', '.join(SUPPORTED_ROUTES)}. "
             "Defaults to 'all' for Qwen models.",
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


ALL_PIPELINE_CONFIGS = [
    {"route": "vila_planning",            "batch_relations": True},
    {"route": "villain_direct_pddl",      "batch_relations": True},
    {"route": "villain_captioning_pddl",  "batch_relations": True},
    {"route": "scene_graph_to_pddl",      "batch_relations": True},
    {"route": "multi_step_with_vlm",      "batch_relations": True},   # AP-SG-P
    {"route": "multi_step_with_vlm",      "batch_relations": False},  # EP-SG-P
]


def _is_qwen_model(model_name: str) -> bool:
    resolved = resolve_model_name(model_name)
    return "qwen3-vl" in resolved.lower() or model_name.lower().startswith("qwen")


def _pipeline_label(cfg: dict) -> str:
    route = cfg["route"]
    if route == "multi_step_with_vlm":
        return f"{route}_{'batch' if cfg['batch_relations'] else 'individual'}"
    return route


def _f1(p, r):
    return 2 * p * r / (p + r) if (p + r) > 0 else 0.0


def evaluate_results(result_dir, dataset_path, route, dataset_name, model_name):
    """Run evaluation on completed results and save eval_report.json + eval_summary.csv."""
    result_dir_str = str(result_dir)
    data_dir_str = str(dataset_path)
    is_plan_route = route == "vila_planning"

    # Step 1: check_plans — plan success via simulation (always run, needs plan.txt)
    try:
        check_report = check_plans_iter_dir(result_dir_str, data_dir_str)
    except Exception as e:
        print(f"[eval] check_plans failed: {e}")
        check_report = {"summary": {}, "tasks": []}

    plan_summary = check_report.get("summary", {})
    task_success_rate = plan_summary.get("success_rate", 0.0)
    tasks_total = plan_summary.get("tasks_total", 0)
    tasks_with_plan = plan_summary.get("tasks_with_plan", 0)

    # Step 2: precision/recall on problem.pddl (only for PDDL routes)
    pr_report = {"summary": {}, "tasks": []}
    pr_summary_data = {}
    if not is_plan_route:
        mapping_index = load_mapping_index(check_report)
        task_results = []
        for task_id in sorted(os.listdir(result_dir_str)):
            task_path = os.path.join(result_dir_str, task_id)
            if not os.path.isdir(task_path):
                continue
            mapping = mapping_index.get(task_id)
            task_results.append(pr_eval_task(task_id, result_dir_str, data_dir_str, mapping))

        pr_summary_data = pr_build_summary(task_results)
        pr_report = {
            "result_dir": result_dir_str,
            "data_dir": data_dir_str,
            "summary": pr_summary_data,
            "tasks": task_results,
        }

    # Step 3: merge into unified report
    merged_report = merge_reports(check_report, pr_report)

    # Save eval_report.json
    report_path = result_dir / "eval_report.json"
    with open(report_path, "w", encoding="utf-8") as f:
        json.dump(merged_report, f, indent=2, ensure_ascii=False)

    # Step 4: build one-line summary row
    by_sec = pr_summary_data.get("by_section", {})
    overall = pr_summary_data.get("overall", {})

    def _sec_vals(section_name):
        sec = by_sec.get(section_name, {})
        p = sec.get("macro_precision", 0.0)
        r = sec.get("macro_recall", 0.0)
        return p, r, _f1(p, r)

    obj_p, obj_r, obj_f1 = _sec_vals("objects")
    init_p, init_r, init_f1 = _sec_vals("init")
    goal_p, goal_r, goal_f1 = _sec_vals("goal")
    macro_p = overall.get("macro_precision", 0.0)
    macro_r = overall.get("macro_recall", 0.0)
    macro_f1 = _f1(macro_p, macro_r)

    # gen_success_rate from metrics.json if it exists
    metrics_path = result_dir / "metrics.json"
    gen_success_rate = 0.0
    pddl_valid_rate = 0.0
    if metrics_path.exists():
        with open(metrics_path) as f:
            gen_metrics = json.load(f)
        total = gen_metrics.get("tasks_total", 0)
        if total > 0:
            gen_success_rate = gen_metrics.get("generation_success", 0) / total
            pddl_valid_rate = gen_metrics.get("pddl_valid", 0) / total

    summary_row = {
        "route": route,
        "dataset": dataset_name,
        "model": model_name,
        "gen_success_rate": round(gen_success_rate, 4),
        "pddl_valid_rate": round(pddl_valid_rate, 4),
        "task_success_rate": round(task_success_rate, 4),
        "obj_precision": round(obj_p, 4),
        "obj_recall": round(obj_r, 4),
        "obj_f1": round(obj_f1, 4),
        "init_precision": round(init_p, 4),
        "init_recall": round(init_r, 4),
        "init_f1": round(init_f1, 4),
        "goal_precision": round(goal_p, 4),
        "goal_recall": round(goal_r, 4),
        "goal_f1": round(goal_f1, 4),
        "macro_precision": round(macro_p, 4),
        "macro_recall": round(macro_r, 4),
        "macro_f1": round(macro_f1, 4),
    }

    # Save eval_summary.csv
    csv_path = result_dir / "eval_summary.csv"
    with open(csv_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(summary_row.keys()))
        writer.writeheader()
        writer.writerow(summary_row)

    print(f"\n[eval] Saved {report_path}")
    print(f"[eval] Saved {csv_path}")
    print(f"[eval] task_success_rate={task_success_rate:.2%}  "
          f"macro_P={macro_p:.4f}  macro_R={macro_r:.4f}  macro_F1={macro_f1:.4f}")

    return summary_row


def run_single_route(
    route, task_names, dataset_path, dataset_name, config, model, args,
    output_root, run_name, batch_relations_override=None,
):
    """Run one pipeline route across all tasks. Returns metrics dict and result_dir."""
    label = route
    if route == "multi_step_with_vlm" and batch_relations_override is not None:
        label = f"{route}_{'batch' if batch_relations_override else 'individual'}"

    result_dir = (
        output_root
        / dataset_name
        / label
        / _sanitize_component(args.model)
        / _sanitize_component(run_name)
    )
    result_dir.mkdir(parents=True, exist_ok=True)

    compare_domain = _infer_compare_domain(dataset_name)

    # Build a lightweight args proxy so generate_pddl sees the right route/batch_relations
    class _Args:
        pass
    route_args = _Args()
    for attr in vars(args):
        setattr(route_args, attr, getattr(args, attr))
    route_args.route = route
    if batch_relations_override is not None:
        route_args.batch_relations = batch_relations_override

    print("=" * 80)
    print(f"Pipeline: {label}")
    print(f"Dataset:  {dataset_path}")
    print(f"Model:    {args.model}")
    print(f"Tasks:    {len(task_names)}")
    print(f"Results:  {result_dir}")
    print("=" * 80)

    metrics = {
        "tasks_total": len(task_names),
        "generation_success": 0,
        "generation_failure": 0,
        "task_exceptions": 0,
        "pddl_valid": 0,
        "planner_success": 0,
        "plan_match_success": 0,
    }

    for task_name in tqdm(task_names, desc=f"[{label}]"):
        task_dir = result_dir / task_name
        task_dir.mkdir(parents=True, exist_ok=True)

        try:
            problem_data = load_problem_data(
                str(dataset_path),
                task_name,
                enable_caption=route_args.enable_caption,
                clean_image=route_args.clean_image,
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
                args=route_args,
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

                    if route_args.validate_with_planner:
                        planner_ok, planner_msg, planner_plan = check_error(
                            final_problem,
                            target["domain"],
                            route_args.downward_dir,
                            route_args.time_limit,
                        )
                        if planner_ok:
                            metrics["planner_success"] += 1
                            _write_text(task_dir / "planner_validation.txt", "solved\n")
                            # Save the planner-generated plan
                            if planner_plan:
                                _write_text(task_dir / "plan.txt", planner_plan)
                                # Score against ground truth
                                pred_plan_lines = planner_plan.splitlines()
                                gt_plan_lines = target["plan"].splitlines()
                                plan_ok, plan_msg = compare_plans(
                                    gt_plan_lines, pred_plan_lines, compare_domain
                                )
                                if plan_ok:
                                    metrics["plan_match_success"] += 1
                                    _write_text(task_dir / "plan_validation.txt", "matched\n")
                                else:
                                    _write_text(
                                        task_dir / "plan_validation.txt",
                                        f"mismatch\n{plan_msg or ''}\n",
                                    )
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
    print(f"Metrics for {label}")
    print("=" * 80)
    print(f"Generation success: {metrics['generation_success']}/{total} ({gen_rate:.2%})")
    print(f"Generation failure: {metrics['generation_failure']}")
    print(f"Task exceptions:    {metrics['task_exceptions']}")
    print(f"PDDL valid tasks:   {metrics['pddl_valid']}")
    if route_args.validate_with_planner:
        print(f"Planner success:    {metrics['planner_success']}")
    print(f"Plan match success: {metrics['plan_match_success']}")
    print(f"Output: {result_dir}")
    print("=" * 80)

    # Run evaluation
    try:
        evaluate_results(result_dir, dataset_path, route, dataset_name, args.model)
    except Exception:
        print(f"[eval] Evaluation failed:\n{traceback.format_exc()}")

    return metrics, result_dir


def main():
    repo_root = Path(__file__).resolve().parents[1]
    load_dotenv(repo_root / ".env")

    args = parse_args()
    seed_everything(args.seed)

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

    # Determine whether to run all pipelines or a single route
    run_all = False
    if args.route is None:
        if _is_qwen_model(args.model):
            run_all = True
        else:
            raise ValueError("--route is required for non-Qwen models.")
    elif args.route.lower() == "all":
        run_all = True

    # Load model once (reused across all pipelines)
    model = VLMClientFactory(args.model, args.device)

    if run_all:
        all_metrics = {}
        for cfg in ALL_PIPELINE_CONFIGS:
            label = _pipeline_label(cfg)
            print(f"\n{'#' * 80}")
            print(f"# Starting pipeline: {label}")
            print(f"{'#' * 80}\n")
            metrics, result_dir = run_single_route(
                route=cfg["route"],
                task_names=task_names,
                dataset_path=dataset_path,
                dataset_name=dataset_name,
                config=config,
                model=model,
                args=args,
                output_root=output_root,
                run_name=run_name,
                batch_relations_override=cfg["batch_relations"],
            )
            all_metrics[label] = metrics

        # Print combined summary
        print("\n" + "#" * 80)
        print("# ALL PIPELINES SUMMARY")
        print("#" * 80)
        for label, m in all_metrics.items():
            total = m["tasks_total"]
            gen_ok = m["generation_success"]
            rate = gen_ok / total if total else 0.0
            print(f"  {label:45s}  gen={gen_ok}/{total} ({rate:.0%})  "
                  f"pddl_valid={m['pddl_valid']}  plan_match={m['plan_match_success']}")
        print("#" * 80)

        # Save combined metrics
        combined_dir = output_root / dataset_name / "all_pipelines" / _sanitize_component(args.model) / _sanitize_component(run_name)
        combined_dir.mkdir(parents=True, exist_ok=True)
        with open(combined_dir / "all_metrics.json", "w", encoding="utf-8") as f:
            json.dump(all_metrics, f, indent=2)
        print(f"Combined metrics saved to: {combined_dir / 'all_metrics.json'}")
    else:
        route = normalize_route_name(args.route)
        run_single_route(
            route=route,
            task_names=task_names,
            dataset_path=dataset_path,
            dataset_name=dataset_name,
            config=config,
            model=model,
            args=args,
            output_root=output_root,
            run_name=run_name,
        )


if __name__ == "__main__":
    main()
