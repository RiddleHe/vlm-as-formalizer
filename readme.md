# Vision Language Models Cannot Plan, but Can They Formalize?

## Setup

```bash
pip install -r requirements.txt
```

Requires an `.env` file with `OPENAI_API_KEY` for LLM-based object mapping during evaluation.

## Datasets

Three datasets under `data/`:

- `alfred_multi` — 150 household tasks
- `blocksworld_real` — 102 real-image block stacking tasks
- `blocksworld_sim` — 10 simulated block stacking tasks (symlinked from vlm-asf)

Each task directory has the following structure:

```
task_1/
    observations/
        image_1.png
        image_2.png
    domain.pddl
    instruction.txt
    problem.pddl       # ground truth
    plan.txt            # ground truth
```

## Run pipelines

All pipelines run through `src/main.py`. Each run generates outputs, runs the Fast Downward planner (with `--validate_with_planner`), and automatically evaluates results (task success via plan simulation, precision/recall on problem.pddl).

### Single route

```bash
python src/main.py \
    --route villain_direct_pddl \
    --dataset blocksworld_real \
    --model gpt-5.2 \
    --validate_with_planner \
    --num_tries 3
```

Available routes:
- `vila_planning` — Direct Planning (Direct-Plan)
- `villain_direct_pddl` — Direct PDDL Generation (Direct-P)
- `villain_captioning_pddl` — Caption PDDL Generation (Caption-P)
- `scene_graph_to_pddl` — Scene Graph PDDL Generation (SG-P)
- `multi_step_with_vlm` — Multi-step VLM PDDL (use `--batch_relations` or `--no-batch_relations`)

### Full run across datasets and routes

```bash
bash scripts/run_qwen_full.sh
```

This runs all 4 main routes across all 3 datasets, then merges per-run eval summaries into a single CSV at `results/eval_summary_*.csv`.

### Additional options
- `--dataset`: `alfred_multi`, `blocksworld_real`, `blocksworld_sim`
- `--time_limit`: Planner timeout in seconds (default: 30)
- `--num_tries`: Number of generation attempts per task (default: 3)
- `--task_limit`: Limit number of tasks to process
- `--task_offset`: Skip first N tasks
- `--run_name`: Custom name for the run (default: timestamp)

## Evaluation

Evaluation runs automatically at the end of each pipeline. It can also be re-run standalone on existing results via `scripts/rerun_evals.py`.

### What the evaluation does

1. **Plan simulation** (`src/eval/check_plans.py`): For each task with a `plan.txt`, maps predicted object names to ground-truth objects (heuristic + LLM fallback via GPT-5-mini), translates the plan, and simulates it step-by-step against the ground-truth domain and problem. A task succeeds only if the plan executes without precondition failures and reaches the goal state.

2. **Precision/Recall** (`src/eval/calculate_precision_recall.py`): For PDDL routes, compares the predicted `problem.pddl` against ground truth on three sections — objects, init, and goal — computing per-section and macro P/R/F1.

### Output files per run

```
results/<dataset>/<route>/<model>/<run_name>/
    metrics.json            # generation & planner counts
    eval_report.json        # full per-task eval detail
    eval_summary.csv        # one-line summary row
    <task_name>/
        problem.pddl        # predicted
        plan.txt             # planner output (if solvable)
        prompt.txt
        response.txt
        generation_summary.json
```

### Summary CSV columns

`route, dataset, model, gen_success_rate, pddl_valid_rate, task_success_rate, obj_precision, obj_recall, obj_f1, init_precision, init_recall, init_f1, goal_precision, goal_recall, goal_f1, macro_precision, macro_recall, macro_f1`