from ..build_prompts import build_plan_prompt
from ..parse_response import parse_plan

def generate_vila_planning(
    target,
    config, 
    model,
    observations,
    retry_idx,
):
    
    # Build prompt for direct plan generation
    plan_prompt = build_plan_prompt(target, config)
    
    # Direct VLM call to generate plan
    plan_response = model.generate(plan_prompt, observations)
    
    # Parse the clean action sequence from VLM response
    clean_plan = parse_plan(plan_response)
    
    return clean_plan, plan_response, plan_prompt 