# Villain

## Command Usage

The core script is `scripts/main.py`.

**General Syntax:**

```bash
python main.py \
    --domain [domain] \
    --result_dir [result] \
    --model [model] \
    --[pipeline name] \
    --find_plan  # if has find_plan, will produce both PDDL and solve plan
```

**Arguments:**

*   `--domain`: (Required) The name of the domain (e.g., `alfred`, `blocksworld-real`). Must correspond to a specified dataset.
*   `--result_dir`: (Optional) A custom suffix for the results directory name. If not provided, a timestamp is used.
*   `--model`: (Required) Specifies the VLM model to use (e.g., `gpt-4o-mini`, `meta-llama/Meta-Llama-3-8B-Instruct`). The model name is appended to the `result_dir`.
*   `--find_plan`: Flag to run the Fast Downward planner on the PDDL files

**Examples:**

```bash
python scripts/main.py --domain alfred --model gpt-4.1 --generate_multi_step_with_vlm --no_batch_relations --find_plan
```

## Dataset structure

```
.
├── [task_name_1]
│   ├── instruction.txt 
│   ├── domain.pddl         
│   ├── observations /      
│       │   └── observations-1.jpg
│       │   └── observations-2.jpg
│   ├── problem.pddl      
│   ├── plan.txt
│
├── [task_name_2]
```