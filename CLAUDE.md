# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VILLAIN is a vision-language model (VLM) framework for generating PDDL (Planning Domain Definition Language) files from visual observations and natural language instructions. The project combines computer vision models (like YOLO and SGCLIP) with language models to convert real-world scenes into formal planning problems.

## High-Level Architecture

### Core Components

1. **Vision Pipeline**
   - YOLO/SGCLIP for object detection and scene graph generation
   - Grounding DINO integration for advanced object detection
   - Scene graph construction for relationship detection between objects

2. **Language Model Integration**
   - VLM clients supporting multiple models (GPT-4, Gemma, InternVL, etc.)
   - Prompt engineering for PDDL generation
   - Multi-step refinement capabilities

3. **Planning System**
   - Fast Downward planner integration
   - VAL validator for plan verification
   - PDDL problem and domain file generation

## Common Commands

### Running the Main Pipeline

```bash
# Basic PDDL generation with object detection
python scripts/main.py --domain_name blocksworld --model gemma3-27B --generate_multi_step --generate_from_cv_model --find_plan

# Generate both domain and problem files
python scripts/main.py --domain_name cooking --model gpt-4o-mini --generate_problem --generate_domain --find_plan

# Refine existing problems
python scripts/main.py --domain_name cooking --result_dir my_run --model gpt-4o-mini --gen_step base --refine_problem --find_plan

# Run with full logging (recommended)
./run_with_full_logging.sh
```

### Testing Individual Components

```bash
# Test YOLO detection
python test_yolo.py

# Test VLM inference
python test_vlm.py

# Find plan for specific problem
python scripts/find_plan.py --domain path/to/domain.pddl --problem path/to/problem.pddl
```

### Key Arguments

- `--domain_name`: Target domain (blocksworld, cooking, hanoi, blocksworld-real)
- `--model`: VLM model to use (gemma3-27B, gpt-4o-mini, internvl3-14B, qwenvl-7B)
- `--generate_from_cv_model`: Use computer vision models for object detection
- `--generate_multi_step`: Enable multi-step PDDL generation with scene graphs
- `--find_plan`: Run Fast Downward planner on generated problems
- `--num_tries`: Number of generation attempts (default: 3)

## Development Workflow

### Adding New Domains

1. Create domain directory in `data/<domain_name>/`
2. Add domain-level files:
   - `domain.pddl`: Domain definition
   - `config.json`: Optional domain configuration
3. For each problem, create a subdirectory `data/<domain_name>/problem<N>/` containing:
   - `problem.pddl`: Ground truth PDDL problem
   - `instruction.txt`: Natural language task description
   - `observation*.jpg`: Task images (can have multiple numbered images)
   - `observation_clean.jpg`: Optional clean/goal state image
   - `instruction_captioned.txt`: Optional captioned instruction
   - `annotated_bbox.json`: Optional bounding box annotations

### Model Configuration

VLM models are configured through environment variables:
- Set API keys in `.env` file
- GPU selection via `CUDA_VISIBLE_DEVICES`
- Model factory in `scripts/utils/models.py`

### Output Structure

Results are saved to `results/<domain>_<timestamp>_<model>/`:
- `base/`: Initial generation results
- `refine_N/`: Refinement iteration N
- Each contains: `problems/`, `responses/`, `instructions/`, `plans/`, `errors/`

## Key Implementation Details

### Scene Graph Pipeline (SGCLIP)
- Located in `scripts/utils/sgclip.py`
- Handles object detection, relationship prediction, and visualization
- Generates bounding boxes and spatial relationships

### PDDL Generation
- Main logic in `scripts/utils/generate.py`
- Supports end-to-end, multi-step, and plan-only generation modes
- Prompt templates in `scripts/utils/build_prompts.py`

### Planning Integration
- Fast Downward wrapper in `scripts/utils/checkers.py`
- Automatic error detection and refinement triggers
- Plan validation using VAL

## Important Notes

- The project requires Docker for full functionality (see Dockerfile)
- Fast Downward and VAL must be built/installed (handled by Docker)
- GPU is recommended for vision models
- Results include visualizations with bounding boxes when using CV models