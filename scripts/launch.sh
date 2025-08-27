#! /bin/bash
export VLLM_BASE_URL=http://localhost:15100/v1
CUDA_VISIBLE_DEVICES=0,1,2,3 python main.py \
  --domain alfred \
  --model qwenvl-72B-vllm \
  --generate_multi_step_with_vlm \
  --find_plan \
  --result_dir qwen72B_multi_step_vlm_alfred_fixed \
  --no_batch_relation