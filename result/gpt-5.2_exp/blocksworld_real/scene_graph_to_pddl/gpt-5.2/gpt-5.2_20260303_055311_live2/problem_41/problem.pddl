(define (problem blocksworld_scene_stacks_3)
  (:domain blocksworld)
  (:objects
    orange_block_small_stack_top - block
    blue_block_small_stack_bottom - block
    purple_block_tall_stack_top - block
    green_block_tall_stack_second - block
    red_block_tall_stack_third - block
    yellow_block_tall_stack_bottom - block
    robot_arm - robot
  )

  (:init
    ;; robot state
    (handempty robot_arm)

    ;; table placements
    (ontable blue_block_small_stack_bottom)
    (ontable yellow_block_tall_stack_bottom)

    ;; stacks in the scene
    (on orange_block_small_stack_top blue_block_small_stack_bottom)
    (on purple_block_tall_stack_top green_block_tall_stack_second)
    (on green_block_tall_stack_second red_block_tall_stack_third)
    (on red_block_tall_stack_third yellow_block_tall_stack_bottom)

    ;; clear blocks
    (clear orange_block_small_stack_top)
    (clear purple_block_tall_stack_top)
  )

  (:goal
    (and
      (on orange_block_small_stack_top purple_block_tall_stack_top)
      (on green_block_tall_stack_second blue_block_small_stack_bottom)
      (on yellow_block_tall_stack_bottom red_block_tall_stack_third)
    )
  )
)