(define (problem blocksworld_scene_stacks)
  (:domain blocksworld)
  (:objects
    purple_single_block - block
    blue_block_in_two_stack - block
    orange_block_in_two_stack - block
    yellow_bottom_in_three_stack - block
    green_middle_in_three_stack - block
    red_top_in_three_stack - block
    robot_arm - robot
  )

  (:init
    (ontable purple_single_block)
    (ontable blue_block_in_two_stack)
    (ontable yellow_bottom_in_three_stack)

    (on orange_block_in_two_stack blue_block_in_two_stack)
    (on green_middle_in_three_stack yellow_bottom_in_three_stack)
    (on red_top_in_three_stack green_middle_in_three_stack)

    (clear purple_single_block)
    (clear orange_block_in_two_stack)
    (clear red_top_in_three_stack)

    (handempty robot_arm)
  )

  (:goal
    (and
      (on red_top_in_three_stack yellow_bottom_in_three_stack)
      (on yellow_bottom_in_three_stack orange_block_in_two_stack)
      (on orange_block_in_two_stack blue_block_in_two_stack)
      (on green_middle_in_three_stack purple_single_block)
    )
  )
)