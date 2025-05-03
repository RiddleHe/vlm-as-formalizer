#!/bin/bash

DOMAIN=$1
MODEL=$2
RESULT_DIR=$3

echo "Running with:"
echo "  Domain: $DOMAIN"
echo "  Model: $MODEL"
echo "  Result Directory: $RESULT_DIR"

COMMON_ARGS="python main.py --model $MODEL --domain $DOMAIN --result_dir $RESULT_DIR"
GEN_DOMAIN_FLAG="--generate_domain"
 
echo "Generating problem directly..."
$COMMON_ARGS --generate_problem 
$COMMON_ARGS --find_plan 
$COMMON_ARGS --refine_problem 
$COMMON_ARGS --gen_step refine_1 --find_plan 

echo "Generating problem with domain..."
$COMMON_ARGS --generate_problem $GEN_DOMAIN_FLAG
$COMMON_ARGS --find_plan $GEN_DOMAIN_FLAG
$COMMON_ARGS --refine_problem $GEN_DOMAIN_FLAG
$COMMON_ARGS --gen_step refine_1 --find_plan $GEN_DOMAIN_FLAG

echo "Generating plan directly..."
$COMMON_ARGS --generate_plan

echo "Done!"