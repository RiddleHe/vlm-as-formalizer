(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_block_top_left_stack - block
    red_block_middle_left_stack - block
    green_block_bottom_left_stack - block
    purple_block_top_right_stack - block
    yellow_block_middle_right_stack - block
    blue_block_bottom_right_stack - block
    robot_arm_1 - robot
  )

  (:init
    (ontable green_block_bottom_left_stack)
    (ontable blue_block_bottom_right_stack)

    (on orange_block_top_left_stack red_block_middle_left_stack)
    (on red_block_middle_left_stack green_block_bottom_left_stack)

    (on purple_block_top_right_stack yellow_block_middle_right_stack)
    (on yellow_block_middle_right_stack blue_block_bottom_right_stack)

    (clear orange_block_top_left_stack)
    (clear purple_block_top_right_stack)

    (handempty robot_arm_1)
  )

  (:goal
    (and
      (on purple_block_top_right_stack yellow_block_middle_right_stack)
      (on yellow_block_middle_right_stack orange_block_top_left_stack)

      (on blue_block_bottom_right_stack red_block_middle_left_stack)
      (on red_block_middle_left_stack green_block_bottom_left_stack)
    )
  )
)