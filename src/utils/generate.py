from .checkers import check_error, check_pddl
from .baseline import (
    generate_multi_step_with_vlm,
    generate_scene_graph_to_pddl,
    generate_vila_planning,
    generate_villain_captioning_pddl,
    generate_villain_direct_pddl,
    generate_villain_pddl,
)


SUPPORTED_ROUTES = [
    "vila_planning",
    "villain_direct_pddl",
    "villain_captioning_pddl",
    "scene_graph_to_pddl",
    "multi_step_with_vlm",
]

ROUTE_ALIASES = {
    "generate_vila_planning": "vila_planning",
    "generate_villain_pddl": "villain_pddl",
    "generate_villain_direct_pddl": "villain_direct_pddl",
    "generate_villain_captioning_pddl": "villain_captioning_pddl",
    "generate_scene_graph_pddl": "scene_graph_to_pddl",
    "generate_scene_graph_to_pddl": "scene_graph_to_pddl",
    "generate_multi_step_with_vlm": "multi_step_with_vlm",
}

ROUTE_KINDS = {
    "vila_planning": "plan",
    "villain_direct_pddl": "pddl",
    "villain_captioning_pddl": "pddl",
    "scene_graph_to_pddl": "pddl",
    "multi_step_with_vlm": "pddl",
}


def normalize_route_name(route_name: str) -> str:
    normalized = route_name.strip().lower().replace("-", "_")
    normalized = ROUTE_ALIASES.get(normalized, normalized)
    if normalized not in ROUTE_KINDS:
        raise ValueError(
            f"Unknown route '{route_name}'. Supported routes: {', '.join(SUPPORTED_ROUTES)}"
        )
    return normalized


def route_kind(route_name: str) -> str:
    return ROUTE_KINDS[normalize_route_name(route_name)]


def _resolve_route_from_args(args) -> str:
    route_name = getattr(args, "route", None)
    if route_name:
        return normalize_route_name(route_name)

    # Backward compatibility for legacy boolean CLI flags.
    legacy_flags = [
        ("generate_vila_planning", "vila_planning"),
        ("generate_villain_pddl", "villain_pddl"),
        ("generate_villain_direct_pddl", "villain_direct_pddl"),
        ("generate_villain_captioning_pddl", "villain_captioning_pddl"),
        ("generate_scene_graph_pddl", "scene_graph_to_pddl"),
        ("generate_multi_step_with_vlm", "multi_step_with_vlm"),
    ]
    enabled = [route for flag, route in legacy_flags if getattr(args, flag, False)]
    if len(enabled) == 1:
        return enabled[0]
    if len(enabled) > 1:
        raise ValueError(
            f"Multiple routes selected in legacy flags: {enabled}. Please pass one --route."
        )
    raise ValueError("No generation route selected. Pass --route.")


def _run_single_attempt(route_name, target, config, model, observations, retry_idx, args):
    if route_name == "multi_step_with_vlm":
        return generate_multi_step_with_vlm(
            target,
            config,
            model,
            observations,
            retry_idx,
            batch_relations=getattr(args, "batch_relations", True),
        )

    if route_name == "scene_graph_to_pddl":
        return generate_scene_graph_to_pddl(
            target,
            config,
            model,
            observations,
            retry_idx,
            hard_template=getattr(args, "hard_template", True),
        )

    if route_name == "vila_planning":
        return generate_vila_planning(
            target,
            config,
            model,
            observations,
            retry_idx,
        )


    if route_name == "villain_direct_pddl":
        return generate_villain_direct_pddl(
            target,
            config,
            model,
            observations,
            retry_idx,
        )

    if route_name == "villain_captioning_pddl":
        return generate_villain_captioning_pddl(
            target,
            config,
            model,
            observations,
            retry_idx,
        )

    raise ValueError(f"Unsupported route: {route_name}")


def generate_pddl(
    target,
    config,
    model,
    args,
    result_dir=None,
    save_step=None,
    task_name=None,
):
    del result_dir, save_step, task_name  # maintained for call compatibility

    route_name = _resolve_route_from_args(args)
    kind = route_kind(route_name)
    observations = target.get("observations", [])
    attempts = []
    num_tries = max(1, int(getattr(args, "num_tries", 1)))
    validate_with_planner = bool(getattr(args, "validate_with_planner", False))
    downward_dir = getattr(args, "downward_dir", "")
    time_limit = int(getattr(args, "time_limit", 30))

    for retry_idx in range(num_tries):
        try:
            generated, response, prompt = _run_single_attempt(
                route_name, target, config, model, observations, retry_idx, args
            )
        except Exception as exc:
            attempts.append(
                {
                    "retry_idx": retry_idx,
                    "success": False,
                    "error": str(exc),
                    "prompt": "",
                    "response": "",
                    "problem": "",
                    "plan": "",
                }
            )
            continue

        if kind == "plan":
            plan_text = (generated or "").strip()
            success = bool(plan_text)
            attempts.append(
                {
                    "retry_idx": retry_idx,
                    "success": success,
                    "error": "" if success else "Empty plan output",
                    "prompt": prompt or "",
                    "response": response or "",
                    "plan": generated or "",
                    "problem": "",
                }
            )
            if success:
                break
            continue

        problem_text = (generated or "").strip()
        success = bool(problem_text)
        error_message = ""

        if not success:
            error_message = "Empty PDDL output"
        elif validate_with_planner:
            success, error_message = check_error(
                problem_text,
                target["domain"],
                downward_dir,
                time_limit,
            )
        else:
            success, error_message = check_pddl(problem_text, target["domain"])

        attempts.append(
            {
                "retry_idx": retry_idx,
                "success": success,
                "error": error_message or "",
                "prompt": prompt or "",
                "response": response or "",
                "problem": generated or "",
                "plan": "",
            }
        )
        if success:
            break

    if not attempts:
        result = {
            "route": route_name,
            "kind": kind,
            "attempts": [],
            "final_index": -1,
            "final": {},
            "success": False,
        }
        return result, False

    first_success_idx = next(
        (idx for idx, attempt in enumerate(attempts) if attempt["success"]),
        None,
    )
    final_index = first_success_idx if first_success_idx is not None else len(attempts) - 1
    final = attempts[final_index]
    success = bool(final["success"])

    result = {
        "route": route_name,
        "kind": kind,
        "attempts": attempts,
        "final_index": final_index,
        "final": final,
        "success": success,
    }
    return result, success
