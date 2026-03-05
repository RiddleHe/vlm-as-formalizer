#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

MODEL=qwen
DATASETS=(blocksworld_real blocksworld_sim alfred_multi)
ROUTES=(villain_direct_pddl vila_planning villain_captioning_pddl scene_graph_to_pddl)
RUN_NAME="qwen_full_$(date +%Y%m%d_%H%M%S)"

echo "============================================================"
echo "Run name: $RUN_NAME"
echo "Model:    $MODEL"
echo "Datasets: ${DATASETS[*]}"
echo "Routes:   ${ROUTES[*]}"
echo "============================================================"

for dataset in "${DATASETS[@]}"; do
  for route in "${ROUTES[@]}"; do
    echo ""
    echo ">>> Running: dataset=$dataset  route=$route"
    python "$REPO_ROOT/src/main.py" \
      --model "$MODEL" \
      --dataset "$dataset" \
      --route "$route" \
      --run_name "$RUN_NAME" \
      --validate_with_planner \
      --num_tries 3
  done
done

# Merge all eval_summary.csv into one final report
RESULTS_DIR="$REPO_ROOT/results"
MERGED_CSV="$RESULTS_DIR/eval_summary_${RUN_NAME}.csv"

echo ""
echo ">>> Merging eval summaries into $MERGED_CSV"

HEADER_WRITTEN=false
for dataset in "${DATASETS[@]}"; do
  for route in "${ROUTES[@]}"; do
    CSV_FILE="$RESULTS_DIR/$dataset/$route/$(echo "$MODEL" | sed 's/[^A-Za-z0-9._-]/-/g')/$RUN_NAME/eval_summary.csv"
    if [[ -f "$CSV_FILE" ]]; then
      if [[ "$HEADER_WRITTEN" == false ]]; then
        cat "$CSV_FILE" >> "$MERGED_CSV"
        HEADER_WRITTEN=true
      else
        tail -n +2 "$CSV_FILE" >> "$MERGED_CSV"
      fi
    else
      echo "  [WARN] Missing: $CSV_FILE"
    fi
  done
done

echo ""
echo "============================================================"
echo "All runs complete."
echo "Merged summary: $MERGED_CSV"
echo "============================================================"
