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

All pipelines run through `src/main.py` as the entrypoint. 

The basic syntax is:

```python
python src/main.py \
    --domain [alfred/blocksworld/blocksworld-real] \
    --model [gpt-4.1/qwenvl-72B] \
    --result_dir [dir_path] \
    # choose pipelines
    --generate_villain_direct_pddl \  # Direct-P
    --generate_villain_captioning_pddl \ # Caption-P
    --generate_scene_graph_pddl \ # SG-P
    --batch_relations \ # AP-SG-P
    --no-batch_relations \ # EP-SG-P
    --generate_vila_planning \ # Direct-Plan
```

## Eval

To check plan successes for an evaluation job, run:

```bash
bash src/eval/check_plans.sh $ROOT_DIR $DATA_PATH $OUTPUT_DIR
```

Only after the previous job is run (to match the folder names), to check precision and recall for an evaluation job, run:

```bash
bash src/eval/calculate_precision_recall.sh $ROOT_DIR
```