#!/usr/bin/env python3
"""
Test script to evaluate minimal frame sampling for SAM2/DINO object tracking.
This script tests different frame intervals to find the minimal number of frames
needed for reliable object tracking across a video sequence.
"""

import os
import sys
import imageio
import numpy as np
import json
from pathlib import Path
from collections import defaultdict
import time
from typing import List, Dict, Tuple
import argparse

# Add current directory to path for imports
current_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(current_dir)

from utils.sgclip import predict_all_relations, setup_and_load_models, calculate_iou

def load_video_frames(video_dir: str) -> List[np.ndarray]:
    """Load all video frames from directory."""
    import re
    
    # Get all frame files and extract frame numbers for proper sorting
    frame_files = [f for f in os.listdir(video_dir) if f.startswith('frame_') and f.endswith('.jpg')]
    
    # Sort by extracting the frame number from filename
    def extract_frame_number(filename):
        match = re.search(r'frame_(\d+)\.jpg', filename)
        return int(match.group(1)) if match else 0
    
    frame_files = sorted(frame_files, key=extract_frame_number)
    
    frames = []
    for frame_file in frame_files:
        frame_path = os.path.join(video_dir, frame_file)
        frame = imageio.imread(frame_path)
        frames.append(frame)
    return frames, frame_files

def sample_frames(frames: List[np.ndarray], frame_files: List[str], interval: int) -> Tuple[List[np.ndarray], List[str]]:
    """Sample frames at given interval."""
    sampled_frames = frames[::interval]
    sampled_files = frame_files[::interval]
    return sampled_frames, sampled_files

def calculate_detection_consistency(results_list: List[Dict], iou_threshold: float = 0.5) -> Dict:
    """
    Calculate consistency metrics across different frame samplings.
    
    Args:
        results_list: List of detection results from different sampling rates
        iou_threshold: IoU threshold for considering detections as the same object
    
    Returns:
        Dictionary with consistency metrics
    """
    if not results_list:
        return {}
    
    # Extract object detections from each result
    all_detections = []
    for i, results in enumerate(results_list):
        detections = []
        if 'binary' in results:
            for frame_data in results['binary'].values():
                for obj_pair, relations in frame_data.items():
                    # Extract object bboxes if available
                    # This is simplified - you might need to adapt based on actual result structure
                    pass
        all_detections.append(detections)
    
    # Calculate consistency metrics
    consistency_score = 0.0
    if len(all_detections) > 1:
        # Compare detection consistency between different sampling rates
        # This is a placeholder - implement actual consistency calculation
        base_detections = all_detections[0]
        for other_detections in all_detections[1:]:
            # Calculate overlap/similarity between detection sets
            pass
    
    return {
        'consistency_score': consistency_score,
        'num_objects_detected': len(all_detections[0]) if all_detections else 0,
        'detection_stability': 1.0  # Placeholder
    }

def run_frame_sampling_test(
    video_dir: str,
    object_classes: List[str],
    unary_relations: List[str] = None,
    binary_relations: List[str] = None,
    intervals: List[int] = None,
    output_dir: str = None
) -> Dict:
    """
    Run frame sampling test with different intervals.
    
    Args:
        video_dir: Directory containing video frames
        object_classes: List of object classes to detect
        unary_relations: List of unary relations to predict
        binary_relations: List of binary relations to predict
        intervals: List of frame intervals to test (e.g., [1, 2, 5, 10])
        output_dir: Directory to save results
    
    Returns:
        Dictionary with test results and metrics
    """
    if intervals is None:
        intervals = [1, 2, 5, 10, 15, 20]
    
    if unary_relations is None:
        unary_relations = ["is_empty"]
    
    if binary_relations is None:
        binary_relations = ["on"]
    
    # Load all frames
    print(f"Loading frames from {video_dir}...")
    frames, frame_files = load_video_frames(video_dir)
    total_frames = len(frames)
    print(f"Loaded {total_frames} frames")
    
    if total_frames == 0:
        print("No frames found!")
        return {}
    
    # Setup models
    print("Setting up models...")
    BASE_DIR = os.path.join(os.path.dirname(__file__), "..", "..")
    DEVICE = "cuda"
    models = setup_and_load_models(BASE_DIR, DEVICE, detector_type="dino")
    
    results = {}
    timing_results = {}
    
    for interval in intervals:
        if interval > total_frames:
            print(f"Skipping interval {interval} (larger than total frames {total_frames})")
            continue
            
        print(f"\n=== Testing interval {interval} ===")
        sampled_frames, sampled_files = sample_frames(frames, frame_files, interval)
        num_sampled = len(sampled_frames)
        
        print(f"Using {num_sampled} frames (every {interval}th frame)")
        print(f"Frame files: {sampled_files[:5]}..." if len(sampled_files) > 5 else f"Frame files: {sampled_files}")
        
        # Run detection
        start_time = time.time()
        try:
            detection_results = predict_all_relations(
                images=sampled_frames,
                object_classes=object_classes,
                unary_relations=unary_relations,
                binary_relations=binary_relations,
                models=models,
                detector_type="dino",
            )
            
            end_time = time.time()
            processing_time = end_time - start_time
            
            results[interval] = {
                'detection_results': detection_results,
                'num_frames_used': num_sampled,
                'frame_files': sampled_files,
                'processing_time': processing_time,
                'frames_per_second': num_sampled / processing_time if processing_time > 0 else 0
            }
            
            timing_results[interval] = {
                'total_time': processing_time,
                'time_per_frame': processing_time / num_sampled if num_sampled > 0 else 0,
                'fps': num_sampled / processing_time if processing_time > 0 else 0
            }
            
            print(f"Processing time: {processing_time:.2f}s")
            print(f"Frames per second: {num_sampled / processing_time:.2f}" if processing_time > 0 else "N/A")
            
            # Print summary of detections
            if 'unary' in detection_results:
                unary_count = sum(len(frame_data) for frame_data in detection_results['unary'].values())
                print(f"Unary relations detected: {unary_count}")
            
            if 'binary' in detection_results:
                binary_count = sum(len(frame_data) for frame_data in detection_results['binary'].values())
                print(f"Binary relations detected: {binary_count}")
                
        except Exception as e:
            print(f"Error processing interval {interval}: {str(e)}")
            results[interval] = {
                'error': str(e),
                'num_frames_used': num_sampled,
                'frame_files': sampled_files
            }
    
    # Calculate consistency metrics
    print(f"\n=== Calculating consistency metrics ===")
    valid_results = [r['detection_results'] for r in results.values() if 'detection_results' in r]
    consistency_metrics = calculate_detection_consistency(valid_results)
    
    # Prepare final results
    final_results = {
        'video_info': {
            'video_dir': video_dir,
            'total_frames': total_frames,
            'object_classes': object_classes,
            'unary_relations': unary_relations,
            'binary_relations': binary_relations
        },
        'intervals_tested': intervals,
        'results_by_interval': results,
        'timing_results': timing_results,
        'consistency_metrics': consistency_metrics
    }
    
    # Save results if output directory specified
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)
        output_file = os.path.join(output_dir, f"frame_sampling_test_{Path(video_dir).name}.json")
        
        # Convert numpy arrays to lists for JSON serialization
        serializable_results = json.loads(json.dumps(final_results, default=str))
        
        with open(output_file, 'w') as f:
            json.dump(serializable_results, f, indent=2)
        print(f"Results saved to {output_file}")
    
    return final_results

def print_summary(results: Dict):
    """Print a summary of the test results."""
    print(f"\n{'='*50}")
    print("FRAME SAMPLING TEST SUMMARY")
    print(f"{'='*50}")
    
    if 'video_info' in results:
        info = results['video_info']
        print(f"Video: {info['video_dir']}")
        print(f"Total frames: {info['total_frames']}")
        print(f"Object classes: {info['object_classes']}")
    
    print(f"\nResults by interval:")
    print(f"{'Interval':<10} {'Frames':<8} {'Time(s)':<10} {'FPS':<8} {'Status':<15}")
    print("-" * 55)
    
    if 'results_by_interval' in results:
        for interval, result in results['results_by_interval'].items():
            status = "Success" if 'detection_results' in result else "Error"
            frames = result.get('num_frames_used', 0)
            proc_time = result.get('processing_time', 0)
            fps = result.get('frames_per_second', 0)
            
            print(f"{interval:<10} {frames:<8} {proc_time:<10.2f} {fps:<8.2f} {status:<15}")
    
    # Recommendations
    print(f"\nRecommendations:")
    if 'results_by_interval' in results:
        successful_intervals = [
            (interval, result) for interval, result in results['results_by_interval'].items()
            if 'detection_results' in result
        ]
        
        if successful_intervals:
            # Find the largest interval that still works (most efficient)
            largest_working_interval = max(successful_intervals, key=lambda x: x[0])
            print(f"- Largest working interval: every {largest_working_interval[0]} frames")
            print(f"- This uses {largest_working_interval[1]['num_frames_used']} frames instead of {results['video_info']['total_frames']}")
            reduction = (1 - largest_working_interval[1]['num_frames_used'] / results['video_info']['total_frames']) * 100
            print(f"- Frame reduction: {reduction:.1f}%")
            
            # Find the fastest processing
            fastest = min(successful_intervals, key=lambda x: x[1].get('processing_time', float('inf')))
            print(f"- Fastest processing: interval {fastest[0]} ({fastest[1]['processing_time']:.2f}s)")

def main():
    parser = argparse.ArgumentParser(description='Test frame sampling efficiency for object tracking')
    parser.add_argument('--video_dir', required=True, help='Directory containing video frames')
    parser.add_argument('--output_dir', help='Directory to save results')
    parser.add_argument('--intervals', nargs='+', type=int, default=[1, 2, 5, 10, 15, 20],
                       help='Frame intervals to test')
    parser.add_argument('--object_classes', nargs='+', default=["block"],
                       help='Object classes to detect')
    
    args = parser.parse_args()
    
    # Run the test
    results = run_frame_sampling_test(
        video_dir=args.video_dir,
        object_classes=args.object_classes,
        intervals=args.intervals,
        output_dir=args.output_dir
    )
    
    # Print summary
    print_summary(results)

if __name__ == "__main__":
    main()