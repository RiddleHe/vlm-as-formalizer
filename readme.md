# Vision Language Models Cannot Plan, but Can They Formalize?

## Setup

```bash
pip install -r requirements.txt
```

## Datasets

Two datasets are proposed by the paper: Alfred-Multi (`data/alfred_multi`) and Blocksworld-Real (`data/blocksworld_real`). Both have the following structure which `src/main.py` expects to run pipelines:

```
--- task_1
    |--- observations
         |--- image_1.png
         |--- image_2.png
    |--- domain.pddl
    |--- instruction.txt
    |--- problem.pddl
    |--- plan.txt

--- task_2
--- task_3
...
```

## Run pipelines

All pipelines run through `src/main.py` as the entrypoint. Use `--validate_with_planner` to enable Fast Downward plan generation and validation.

### Direct Planning (Direct-Plan)
```bash
python src/main.py \
    --route vila_planning \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --validate_with_planner
```

### Direct PDDL Generation (Direct-P) 
```bash
python src/main.py \
    --route villain_direct_pddl \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --validate_with_planner
```

### Caption PDDL Generation (Caption-P)
```bash
python src/main.py \
    --route villain_captioning_pddl \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --validate_with_planner
```

### Scene Graph PDDL Generation (SG-P)
```bash
python src/main.py \
    --route scene_graph_to_pddl \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --validate_with_planner
```

### Multi-step VLM PDDL Generation - Batch Mode (AP-SG-P)
```bash
python src/main.py \
    --route multi_step_with_vlm \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --batch_relations \
    --validate_with_planner
```

### Multi-step VLM PDDL Generation - Individual Mode (EP-SG-P) 
```bash
python src/main.py \
    --route multi_step_with_vlm \
    --dataset blocksworld_real \
    --model gpt-4.1 \
    --no-batch_relations \
    --validate_with_planner
```

### Additional Options
- `--dataset`: Use `alfred_multi` or `blocksworld_real`
- `--time_limit`: Planner timeout in seconds (default: 30)
- `--num_tries`: Number of generation attempts per task (default: 3)
- `--task_limit`: Limit number of tasks to process
- `--task_offset`: Skip first N tasks

## Eval

To check plan successes for an evaluation job, run:

```bash
bash src/eval/check_plans.sh $ROOT_DIR $DATA_PATH $OUTPUT_DIR
```

Only after the previous job is run (to match the folder names), to check precision and recall for an evaluation job, run:

```bash
bash src/eval/calculate_precision_recall.sh $ROOT_DIR
```