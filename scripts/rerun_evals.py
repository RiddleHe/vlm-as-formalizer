#!/usr/bin/env python
"""Re-run evaluation on existing result directories (no generation)."""
import csv
import json
import os
import sys
import traceback
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from dotenv import load_dotenv
load_dotenv(Path(__file__).resolve().parents[1] / ".env")

from main import evaluate_results

RESULT_DIRS = [
    # (result_dir, dataset_path, route, dataset_name)
]

REPO = Path(__file__).resolve().parents[1]
RESULTS_ROOT = REPO / "results"
DATA_ROOT = REPO / "data"
RUN_NAME = "qwen_full_20260304_232913"
MODEL = "qwen"
DATASETS = ["blocksworld_real", "blocksworld_sim", "alfred_multi"]
ROUTES = ["villain_direct_pddl", "vila_planning", "villain_captioning_pddl", "scene_graph_to_pddl"]

all_rows = []
for dataset in DATASETS:
    for route in ROUTES:
        result_dir = RESULTS_ROOT / dataset / route / MODEL / RUN_NAME
        if not result_dir.exists():
            print(f"[SKIP] {result_dir} does not exist")
            continue
        dataset_path = DATA_ROOT / dataset
        print(f"\n{'='*60}")
        print(f"Evaluating: {dataset} / {route}")
        print(f"{'='*60}")
        try:
            row = evaluate_results(result_dir, dataset_path, route, dataset, MODEL)
            all_rows.append(row)
        except Exception:
            print(f"[ERROR] {dataset}/{route}:\n{traceback.format_exc()}")

# Write merged CSV
merged_csv = RESULTS_ROOT / f"eval_summary_rerun_{RUN_NAME}.csv"
if all_rows:
    with open(merged_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(all_rows[0].keys()))
        writer.writeheader()
        writer.writerows(all_rows)
    print(f"\nMerged CSV: {merged_csv}")
