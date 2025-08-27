#!/bin/bash

# Test script for Qwen on four pipelines

MODEL="qwenvl-7B"
DOMAINS=("blocksworld" "cooking" "hanoi")

echo "Testing Qwen on four pipelines"
echo "=============================="

for DOMAIN in "${DOMAINS[@]}"; do
    echo "Testing domain: $DOMAIN"
    
    # Pipeline 1: VILLAIN Direct PDDL
    echo "Pipeline 1: VILLAIN Direct PDDL"
    python scripts/main.py --domain_name $DOMAIN --model $MODEL --generate_villain_direct_pddl --find_plan --result_dir results/${DOMAIN}_villain_direct_qwen
    
    # Pipeline 2: VILA Planning
    echo "Pipeline 2: VILA Planning"
    python scripts/main.py --domain_name $DOMAIN --model $MODEL --generate_vila_planning --find_plan --result_dir results/${DOMAIN}_vila_planning_qwen
    
    # Pipeline 3: VILLAIN Captioning PDDL
    echo "Pipeline 3: VILLAIN Captioning PDDL"
    python scripts/main.py --domain_name $DOMAIN --model $MODEL --generate_villain_captioning_pddl --find_plan --result_dir results/${DOMAIN}_villain_captioning_qwen
    
    # Pipeline 4: Scene Graph to PDDL
    echo "Pipeline 4: Scene Graph to PDDL"
    python scripts/main.py --domain_name $DOMAIN --model $MODEL --generate_scene_graph_to_pddl --generate_from_cv_model --find_plan --result_dir results/${DOMAIN}_scene_graph_qwen
    
    echo "Completed $DOMAIN"
    echo "-------------------"
done

echo "All tests completed for Qwen"