#!/usr/bin/env python
"""Evaluate GPT-5.2 results copied from yuchen repo."""
import csv
import json
import sys
import traceback
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from dotenv import load_dotenv
load_dotenv(Path(__file__).resolve().parents[1] / ".env")

from main import evaluate_results

REPO = Path(__file__).resolve().parents[1]
RESULTS_ROOT = REPO / "results"
DATA_ROOT = REPO / "data"
RUN_NAME = "gpt52_from_yuchen"
MODEL = "gpt-5.2"
DATASETS = ["blocksworld_real", "alfred_multi"]
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

merged_csv = RESULTS_ROOT / f"eval_summary_{MODEL}_{RUN_NAME}.csv"
if all_rows:
    with open(merged_csv, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(all_rows[0].keys()))
        writer.writeheader()
        writer.writerows(all_rows)
    print(f"\nMerged CSV: {merged_csv}")
