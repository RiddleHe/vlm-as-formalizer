# Villain


## Folder Structure

```
.
├── data/
│   └── <domain_name>/
│       ├── domain.pddl         # Domain definition file
│       ├── instructions/       # Natural language instructions for each task
│       │   └── problem<N>.txt
│       ├── observations/       # Images corresponding to each task
│       │   └── problem<N>.jpg
│       └── problems/           # Ground truth PDDL problems
│           └── problem<N>.pddl
├── results/
│   └── <domain_name>_<result_dir_or_timestamp>/ # Results for a specific run
│       ├── base/               # Initial generation results
│       │   ├── problems/
│       │   ├── responses/
│       │   ├── instructions/
│       │   ├── plans/
│       │   └── errors/
│       └── refine_<M>/         # Refinement step M results
│           ├── problems/
│           ├── responses/
│           ├── instructions/
│           ├── plans/
│           └── errors/
├── scripts/
│   ├── main.py             # Main pipeline script
│   ├── utils.py            # Utility functions
│   └── model_names.json    # VLM model names
└── README.md               # This file
```

## Command Usage

The core script is `scripts/main.py`.

**General Syntax:**

```bash
python scripts/main.py --domain_name <domain> [--result_dir <name>] [--gen_step <step>] [OPTIONS]
```

**Arguments:**

*   `--domain_name`: (Required) The name of the domain (e.g., `cooking`, `blocksworld`). Must correspond to a directory in `data/`.
*   `--result_dir`: (Optional) A custom suffix for the results directory name. If not provided, a timestamp is used.
*   `--model`: (Required) Specifies the VLM model to use (e.g., `gpt-4o-mini`, `meta-llama/Meta-Llama-3-8B-Instruct`). The model name is appended to the `result_dir`.
*   `--gen_step`: (Optional) Specifies which generation step's results to use for finding plans or as a basis for refinement (e.g., `base`, `refine_1`). Defaults to `base`.
*   `--generate_domain`: Flag to generate both the PDDL domain and problem files. If omitted, only the problem file is generated.
*   `--generate_problem`: Flag to run the initial PDDL generation step. Generates problem file only, unless `--generate_domain` is also specified. Results are saved in `<results_dir>/base/`.
*   `--refine_problem`: Flag to run the PDDL refinement step. Requires results from a previous step (specified by `--gen_step`). Refines problem file only, unless `--generate_domain` is also specified. Results are saved in `<results_dir>/refine_<M>/`.
*   `--find_plan`: Flag to run the Fast Downward planner on the PDDL files in the specified `gen_step`.

**Examples:**

1.  **Initial Generation (Domain + Problem) and Planning for 'cooking' domain using gpt-4o-mini:**
    ```bash
    python scripts/main.py --domain_name cooking --model gpt-4o-mini --generate_problem --generate_domain --find_plan
    ```
    *   Generates PDDL domain and problem files into `results/cooking_<timestamp>_gpt-4o-mini/base/`.
    *   Finds plans for the generated problems, saving plans/errors in `results/cooking_<timestamp>_gpt-4o-mini/base/`.

2.  **Refine problems (and optionally domains if `--generate_domain` is added) from 'base' step and find plans:**
    ```bash
    python scripts/main.py --domain_name cooking --result_dir my_run --model gpt-4o-mini --gen_step base --refine_problem --find_plan
    ```
    *   Assumes `results/cooking_my_run_gpt-4o-mini/base/` exists with generated problems and potentially errors.
    *   Refines problems based on errors in `base`, saving results to `results/cooking_my_run_gpt-4o-mini/refine_1/`.
    *   Finds plans for the *refined* problems in `refine_1`, saving plans/errors in `results/cooking_my_run_gpt-4o-mini/refine_1/`.

3.  **Only find plans for existing 'refine_1' results:**
    ```bash
    python scripts/main.py --domain_name cooking --result_dir my_run --model gpt-4o-mini --gen_step refine_1 --find_plan
    ```
    *   Runs the planner on problems in `results/cooking_my_run_gpt-4o-mini/refine_1/problems/`.
