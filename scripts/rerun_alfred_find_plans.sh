#!/bin/bash

# Script to re-run find_plan for all Alfred experiments
# This will skip PDDL generation (since problem.pddl already exists) and only re-run the planner

echo "Starting batch re-run of find_plan for all Alfred experiments..."

# GPT-4.1 experiments
echo "Processing GPT-4.1 experiments..."

# alfred_gpt41_gpt-4.1_generate_multi_step_with_vlm
echo "1/13: alfred_gpt41_gpt-4.1_generate_multi_step_with_vlm"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41 \
  --model gpt-4.1 \
  --generate_multi_step_with_vlm \
  --find_plan \
  --time_limit 30

# alfred_gpt41_gpt-4.1_generate_multi_step_with_vlm_no_batch_relations  
echo "2/13: alfred_gpt41_gpt-4.1_generate_multi_step_with_vlm_no_batch_relations"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41 \
  --model gpt-4.1 \
  --generate_multi_step_with_vlm \
  --no-batch_relations \
  --find_plan \
  --time_limit 30

# alfred_gpt41_gpt-4.1_generate_scene_graph_hard_pddl
echo "3/13: alfred_gpt41_gpt-4.1_generate_scene_graph_hard_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41 \
  --model gpt-4.1 \
  --generate_scene_graph_pddl \
  --hard_template \
  --find_plan \
  --time_limit 30

# alfred_gpt41_gpt-4.1_generate_villain_captioning_pddl
echo "4/13: alfred_gpt41_gpt-4.1_generate_villain_captioning_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41 \
  --model gpt-4.1 \
  --generate_villain_captioning_pddl \
  --find_plan \
  --time_limit 30

# alfred_gpt41_gpt-4.1_generate_villain_direct_pddl
echo "5/13: alfred_gpt41_gpt-4.1_generate_villain_direct_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41 \
  --model gpt-4.1 \
  --generate_villain_direct_pddl \
  --find_plan \
  --time_limit 30

# alfred_gpt41_vila_fixed_gpt-4.1_generate_vila_planning
echo "6/13: alfred_gpt41_vila_fixed_gpt-4.1_generate_vila_planning"
python scripts/main.py \
  --domain alfred \
  --result_dir gpt41_vila_fixed \
  --model gpt-4.1 \
  --generate_vila_planning \
  --find_plan \
  --time_limit 30

echo "Processing Qwen-72B experiments..."

# alfred_qwen72B_multi_step_vlm_alfred_fixed_qwenvl-72B-vllm_generate_multi_step_with_vlm
echo "7/13: alfred_qwen72B_multi_step_vlm_alfred_fixed_qwenvl-72B-vllm_generate_multi_step_with_vlm"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_multi_step_vlm_alfred_fixed \
  --model qwenvl-72B-vllm \
  --generate_multi_step_with_vlm \
  --find_plan \
  --time_limit 30

# alfred_qwen72B_multi_step_vlm_alfred_fixed_qwenvl-72B-vllm_generate_multi_step_with_vlm_no_batch_relations
echo "8/13: alfred_qwen72B_multi_step_vlm_alfred_fixed_qwenvl-72B-vllm_generate_multi_step_with_vlm_no_batch_relations"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_multi_step_vlm_alfred_fixed \
  --model qwenvl-72B-vllm \
  --generate_multi_step_with_vlm \
  --no-batch_relations \
  --find_plan \
  --time_limit 30

# alfred_qwen72B_rerun_qwenvl-72B-vllm_generate_multi_step_with_vlm_no_batch_relations
echo "9/13: alfred_qwen72B_rerun_qwenvl-72B-vllm_generate_multi_step_with_vlm_no_batch_relations"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_rerun \
  --model qwenvl-72B-vllm \
  --generate_multi_step_with_vlm \
  --no-batch_relations \
  --find_plan \
  --time_limit 30

# alfred_qwen72B_scene_graph_pddl_alfred_qwenvl-72B-vllm_generate_scene_graph_hard_pddl
echo "10/13: alfred_qwen72B_scene_graph_pddl_alfred_qwenvl-72B-vllm_generate_scene_graph_hard_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_scene_graph_pddl_alfred \
  --model qwenvl-72B-vllm \
  --generate_scene_graph_pddl \
  --hard_template \
  --find_plan \
  --time_limit 30

# alfred_qwen72B_vllm_captioning_pddl_alfred_qwenvl-72B-vllm_generate_villain_captioning_pddl
echo "11/13: alfred_qwen72B_vllm_captioning_pddl_alfred_qwenvl-72B-vllm_generate_villain_captioning_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_vllm_captioning_pddl_alfred \
  --model qwenvl-72B-vllm \
  --generate_villain_captioning_pddl \
  --find_plan \
  --time_limit 30

# alfred_qwen72B_vllm_direct_pddl_alfred_qwenvl-72B-vllm_generate_villain_direct_pddl
echo "12/13: alfred_qwen72B_vllm_direct_pddl_alfred_qwenvl-72B-vllm_generate_villain_direct_pddl"
python scripts/main.py \
  --domain alfred \
  --result_dir qwen72B_vllm_direct_pddl_alfred \
  --model qwenvl-72B-vllm \
  --generate_villain_direct_pddl \
  --find_plan \
  --time_limit 30

# alfred_qwenvl-72B_vllm_planning_blocksworld_real_qwenvl-72B-vllm_generate_vila_planning
echo "13/13: alfred_qwenvl-72B_vllm_planning_blocksworld_real_qwenvl-72B-vllm_generate_vila_planning"
python scripts/main.py \
  --domain alfred \
  --result_dir qwenvl-72B_vllm_planning_blocksworld_real \
  --model qwenvl-72B-vllm \
  --generate_vila_planning \
  --find_plan \
  --time_limit 30

echo "All Alfred experiments completed!"
echo "Check the plan.txt and error.txt files in each experiment directory for results."