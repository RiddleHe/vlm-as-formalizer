(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block_top_of_left_stack - block
    orange_block_middle_of_left_stack - block
    blue_block_bottom_of_left_stack - block
    red_block_top_of_right_stack - block
    yellow_block_bottom_of_right_stack - block
    green_block_single_on_table - block
    robot_arm - robot
  )

  (:init
    ;; on-table blocks
    (ontable blue_block_bottom_of_left_stack)
    (ontable yellow_block_bottom_of_right_stack)
    (ontable green_block_single_on_table)

    ;; stacks in the scene
    (on purple_block_top_of_left_stack orange_block_middle_of_left_stack)
    (on orange_block_middle_of_left_stack blue_block_bottom_of_left_stack)
    (on red_block_top_of_right_stack yellow_block_bottom_of_right_stack)

    ;; clear blocks
    (clear purple_block_top_of_left_stack)
    (clear red_block_top_of_right_stack)
    (clear green_block_single_on_table)

    ;; robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      (on green_block_single_on_table red_block_top_of_right_stack)
      (on red_block_top_of_right_stack orange_block_middle_of_left_stack)
      (on orange_block_middle_of_left_stack purple_block_top_of_left_stack)
      (on purple_block_top_of_left_stack blue_block_bottom_of_left_stack)
      (on blue_block_bottom_of_left_stack yellow_block_bottom_of_right_stack)
    )
  )
)