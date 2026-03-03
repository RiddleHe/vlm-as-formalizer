(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    yellow_block_top_left_stack - block
    green_block_middle_left_stack - block
    purple_block_bottom_left_stack - block
    red_block_top_right_stack - block
    orange_block_middle_right_stack - block
    blue_block_bottom_right_stack - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block_bottom_left_stack)
    (ontable blue_block_bottom_right_stack)

    (on yellow_block_top_left_stack green_block_middle_left_stack)
    (on green_block_middle_left_stack purple_block_bottom_left_stack)
    (on red_block_top_right_stack orange_block_middle_right_stack)
    (on orange_block_middle_right_stack blue_block_bottom_right_stack)

    (clear yellow_block_top_left_stack)
    (clear red_block_top_right_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block_top_right_stack yellow_block_top_left_stack)
      (on yellow_block_top_left_stack orange_block_middle_right_stack)

      (on green_block_middle_left_stack blue_block_bottom_right_stack)
      (on blue_block_bottom_right_stack purple_block_bottom_left_stack)
    )
  )
)