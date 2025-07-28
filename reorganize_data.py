#!/usr/bin/env python3
"""
Script to reorganize data folder structure from:
/domain/
  /problems/problem1.pddl
  /observations/problem1.jpg  
  /instructions/problem1.txt

To:
/domain/
  /problem1/
    /problem.pddl
    /observation*.jpg
    /instruction.txt
"""

import os
import shutil
import glob
import re
from pathlib import Path
import argparse


def extract_problem_number(filename):
    """Extract problem number from filename like 'problem1.txt' or 'problem10-1.jpg'"""
    match = re.match(r'problem(\d+)', filename)
    return int(match.group(1)) if match else None


def reorganize_domain(domain_path, dry_run=False):
    """Reorganize a single domain folder"""
    domain_path = Path(domain_path)
    domain_name = domain_path.name
    
    print(f"\n=== Processing domain: {domain_name} ===")
    
    # Backup original structure if not dry run
    if not dry_run:
        backup_path = domain_path.parent / f"{domain_name}_backup"
        if backup_path.exists():
            print(f"Backup already exists at {backup_path}")
        else:
            print(f"Creating backup at {backup_path}")
            shutil.copytree(domain_path, backup_path)
    
    # Get all problem files to determine problem numbers
    problems_dir = domain_path / "problems"
    if not problems_dir.exists():
        print(f"No problems directory found in {domain_path}")
        return
    
    problem_files = list(problems_dir.glob("problem*.pddl"))
    problem_numbers = set()
    
    for pfile in problem_files:
        prob_num = extract_problem_number(pfile.name)
        if prob_num is not None:
            problem_numbers.add(prob_num)
    
    print(f"Found {len(problem_numbers)} problems: {sorted(problem_numbers)}")
    
    # Create new structure for each problem
    for prob_num in sorted(problem_numbers):
        new_problem_dir = domain_path / f"problem{prob_num}"
        
        if dry_run:
            print(f"[DRY RUN] Would create directory: {new_problem_dir}")
        else:
            new_problem_dir.mkdir(exist_ok=True)
            print(f"Created directory: {new_problem_dir}")
        
        # Move problem.pddl
        old_problem_file = problems_dir / f"problem{prob_num}.pddl"
        new_problem_file = new_problem_dir / "problem.pddl"
        if old_problem_file.exists():
            if dry_run:
                print(f"[DRY RUN] Would move: {old_problem_file} -> {new_problem_file}")
            else:
                shutil.move(str(old_problem_file), str(new_problem_file))
                print(f"Moved: {old_problem_file.name} -> {new_problem_file}")
        
        # Move instruction file(s)
        for inst_dir in ["instructions", "instructions_captioned"]:
            inst_path = domain_path / inst_dir
            if inst_path.exists():
                old_inst_file = inst_path / f"problem{prob_num}.txt"
                if old_inst_file.exists():
                    if inst_dir == "instructions":
                        new_inst_file = new_problem_dir / "instruction.txt"
                    else:
                        new_inst_file = new_problem_dir / "instruction_captioned.txt"
                    
                    if dry_run:
                        print(f"[DRY RUN] Would move: {old_inst_file} -> {new_inst_file}")
                    else:
                        shutil.move(str(old_inst_file), str(new_inst_file))
                        print(f"Moved: {old_inst_file.name} -> {new_inst_file}")
        
        # Move observation files (handle multiple images per problem)
        observations_dir = domain_path / "observations"
        if observations_dir.exists():
            # Look for all files matching this problem number exactly
            observation_files = []
            for obs_file in observations_dir.iterdir():
                if obs_file.is_file():
                    # Match exactly problemN.ext or problemN-something.ext
                    pattern = f"^problem{prob_num}([-.].*)?$"
                    if re.match(pattern, obs_file.name):
                        observation_files.append(obs_file)
            
            for obs_file in observation_files:
                # Extract suffix (e.g., "-1", "-2", "-clean") from filename
                filename_pattern = f"^problem{prob_num}(.*?)(\\..*)?$"
                match = re.match(filename_pattern, obs_file.name)
                suffix = match.group(1) if match and match.group(1) else ""
                
                # Determine new filename
                file_ext = obs_file.suffix
                if suffix == "" or suffix.startswith("."):
                    new_obs_file = new_problem_dir / f"observation{file_ext}"
                elif suffix == "-clean":
                    new_obs_file = new_problem_dir / f"observation_clean{file_ext}"
                else:
                    # For numbered observations like -1, -2, -3
                    new_obs_file = new_problem_dir / f"observation{suffix}{file_ext}"
                
                if dry_run:
                    print(f"[DRY RUN] Would move: {obs_file} -> {new_obs_file}")
                else:
                    shutil.move(str(obs_file), str(new_obs_file))
                    print(f"Moved: {obs_file.name} -> {new_obs_file.name}")
        
        # Move annotated bboxes if they exist
        bboxes_dir = domain_path / "annotated_bboxes"
        if bboxes_dir.exists():
            old_bbox_file = bboxes_dir / f"problem{prob_num}.json"
            if old_bbox_file.exists():
                new_bbox_file = new_problem_dir / "annotated_bbox.json"
                
                if dry_run:
                    print(f"[DRY RUN] Would move: {old_bbox_file} -> {new_bbox_file}")
                else:
                    shutil.move(str(old_bbox_file), str(new_bbox_file))
                    print(f"Moved: {old_bbox_file.name} -> {new_bbox_file}")
    
    # Remove old empty directories (if not dry run)
    if not dry_run:
        old_dirs = ["problems", "instructions", "observations", "annotated_bboxes", "instructions_captioned"]
        for old_dir in old_dirs:
            old_dir_path = domain_path / old_dir
            if old_dir_path.exists() and not any(old_dir_path.iterdir()):
                old_dir_path.rmdir()
                print(f"Removed empty directory: {old_dir}")
            elif old_dir_path.exists():
                print(f"Directory {old_dir} not empty, keeping it")


def main():
    parser = argparse.ArgumentParser(description="Reorganize VILLAIN data folder structure")
    parser.add_argument("--domain", type=str, help="Specific domain to reorganize (e.g., 'blocksworld')")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be done without making changes")
    parser.add_argument("--data-dir", type=str, default="data", help="Path to data directory")
    
    args = parser.parse_args()
    
    data_dir = Path(args.data_dir)
    if not data_dir.exists():
        print(f"Data directory {data_dir} does not exist")
        return
    
    if args.domain:
        # Process specific domain
        domain_path = data_dir / args.domain
        if not domain_path.exists():
            print(f"Domain {args.domain} does not exist in {data_dir}")
            return
        reorganize_domain(domain_path, args.dry_run)
    else:
        # Process all domains
        for domain_path in data_dir.iterdir():
            if domain_path.is_dir():
                reorganize_domain(domain_path, args.dry_run)
    
    if args.dry_run:
        print("\n=== DRY RUN COMPLETED ===")
        print("Run without --dry-run to apply changes")
    else:
        print("\n=== REORGANIZATION COMPLETED ===")
        print("Original folders have been backed up with '_backup' suffix")


if __name__ == "__main__":
    main()