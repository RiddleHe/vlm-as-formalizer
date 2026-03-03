# Refactor Worklog (2026-02-27)

## Goal
Make `src/main.py` run six baseline evaluation routes from CLI reliably on datasets under `data/`, with smoke-test coverage and metrics reporting.

## Environment
- Activated env: `conda` env `pddl` (empty at start)
- Installed dependencies from `requirements.txt` into `pddl`
- Loaded `.env` from repo root

## Connectivity Check
- Ran OpenAI probe:
  - `curl https://api.openai.com/v1/models` with `OPENAI_API_KEY` from `.env`
  - Result: `HTTP 401 Incorrect API key`

## Findings (pre-refactor)
- `src/main.py` has hardcoded absolute paths (`/alfred`, `/villain/...`) incompatible with repo-local `data/`.
- CLI route selection is fragmented into many booleans instead of one explicit route arg.
- `main.py` references `args.generate_villain_pddl` but parser does not define it.
- `utils/models.py` contains hardcoded API secrets; OpenAI key handling is unsafe and brittle.
- `utils/build_prompts.py` assumes `config` exists in some paths (`build_goal_prompt`, `build_plan_prompt`) and crashes when absent.
- Current dispatch in `utils/generate.py` depends on old boolean flags and inconsistent success semantics.

## Planned edits
1. Rewrite `main.py` around one required `--route` (six routes).
2. Resolve dataset locally from `data/` and remove hardcoded absolute output/data roots.
3. Refactor route dispatch in `utils/generate.py` to canonical route names + retries.
4. Remove hardcoded keys in `utils/models.py`, rely on env vars.
5. Harden prompt builders for missing `config.json`.
6. Add per-task artifact + metrics reporting and smoke tests for all routes.

## Implemented changes
- Rewrote `src/main.py` to use a single required `--route` argument for exactly one of six baseline routes.
- Added local dataset resolution (`data/`) with aliases (`alfred`, `blocksworld`, etc.) and removed hardcoded absolute data/result paths.
- Added deterministic run output structure under `<output_root>/<dataset>/<route>/<model>/<run_name>/`.
- Added per-task artifact saving for every attempt (`problem/plan`, `prompt`, `response`, `error`) plus `generation_summary.json`.
- Added run-level `metrics.json` and console summary with generation + validation counters.
- Refactored `src/utils/generate.py` to route-based dispatch with retry tracking and uniform result schema.
- Added route normalization/aliases and backward compatibility for old boolean flags.
- Hardened model client auth in `src/utils/models.py`:
  - removed hardcoded OpenAI/OpenRouter/HF keys
  - now reads `OPENAI_API_KEY`, `OPENROUTER_API_KEY`, `HF_TOKEN` from env
- Hardened prompt helpers in `src/utils/build_prompts.py` for missing config:
  - `build_goal_prompt` now handles `config=None`
  - `build_plan_prompt` falls back to parsing actions from domain file
- Hardened `generate_multi_step_with_vlm` relation prompt generation when predicate comments are absent and when object lists/types are missing.
- Hardened `generate_multi_step_with_vlm` goal fallback when model output does not include a parseable `(:goal ...)` block.
- Hardened `load_problem_data` for missing observations directory and explicit UTF-8 file reads.
- Hardened planner error handling in `find_plan` exception path.

## Smoke test matrix run
- Command pattern used (OpenAI model only):
  - `python src/main.py --dataset <dataset> --route <route> --model gpt-4.1-mini --task_limit 1 --num_tries 1 --run_name smoke_<dataset>_<route> --output_root /tmp/vlm-asf-smoke`
- Datasets tested:
  - `blocksworld_real` (1 sample)
  - `alfred_multi` (1 sample)
- Routes tested:
  - `vila_planning`
  - `villain_pddl`
  - `villain_direct_pddl`
  - `villain_captioning_pddl`
  - `scene_graph_to_pddl`
  - `multi_step_with_vlm`
- Result:
  - all 12 runs exited with code `0`
  - all produced expected per-task artifacts and run metrics
  - no unhandled exceptions in logs
  - generation failed in all runs due API credential failure only (OpenAI 401 invalid_api_key)

## External blocker
- Current `.env` `OPENAI_API_KEY` is rejected by OpenAI API (`401 invalid_api_key`), confirmed by direct `curl` and by all route executions.
- Refactored pipeline is execution-ready; successful generation now depends on updating credentials.

## Re-test with refreshed OpenAI key (2026-02-27)
- OpenAI probe: `HTTP 200` from `/v1/models`.
- Ran smoke matrix for `gpt-4.1-mini` across all six routes on one sample from each dataset (`blocksworld_real`, `alfred_multi`).
- Timestamp tag: `20260227_060608`.
- Summary:
  - blocksworld_real: `vila_planning` ✅, `villain_pddl` ✅, `villain_direct_pddl` ✅, `villain_captioning_pddl` ❌ (typed-object format violation), `scene_graph_to_pddl` ✅, `multi_step_with_vlm` ❌ (object parsing produced invalid duplicated `block` object)
  - alfred_multi: `vila_planning` ✅, `villain_pddl` ✅, `villain_direct_pddl` ✅, `villain_captioning_pddl` ✅, `scene_graph_to_pddl` ✅, `multi_step_with_vlm` ❌ (goal references `agent` object absent from parsed object set)

## Unified object format fix (2026-03-03)
- Prompt contract updated in `build_observation_prompt`:
  - Required format is now `type: object1 object2 ...`.
  - Object tokens must be single-token identifiers with underscores.
  - `type: none` required when no objects found.
- Parser updated in `parse_response.py`:
  - Added canonical parser for `type: obj1 obj2` lines.
  - Added normalization for object tokens (underscore-safe names).
  - Added backward-compatible handling for old outputs like `green block blue block` -> `green_block blue_block`.
  - Canonicalized type labels to base type names (e.g., `receptacle (object)` -> `receptacle`).
- Multi-step pipeline updated in `generate_vlm_prompt_scene_graph.py`:
  - Inject default `agent1` / `robot1` when missing.
  - Removed duplicate objects from parent types when already present in subtypes.
  - Relation prompts are now explicitly grounded per predicate instance.

## Validation after fix
- Targeted re-test for `multi_step_with_vlm`:
  - `blocksworld_real`: pass (`gen=1/1`, `pddl_valid=1`)
  - `alfred_multi`: pass (`gen=1/1`, `pddl_valid=1`)

- Full six-route smoke matrix re-run (`gpt-4.1-mini`, one sample each dataset):
  - `multi_step_with_vlm` now passes on both datasets.
