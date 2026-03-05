(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_top_of_stack - block
    purple_block_middle_of_stack - block
    blue_block_bottom_of_stack - block
    orange_block_single - block
    green_block_single - block
    yellow_block_single - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block_bottom_of_stack)
    (ontable orange_block_single)
    (ontable green_block_single)
    (ontable yellow_block_single)

    (on red_block_top_of_stack purple_block_middle_of_stack)
    (on purple_block_middle_of_stack blue_block_bottom_of_stack)

    (clear red_block_top_of_stack)
    (clear orange_block_single)
    (clear green_block_single)
    (clear yellow_block_single)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block_single red_block_top_of_stack)
      (on yellow_block_single purple_block_middle_of_stack)
      (on purple_block_middle_of_stack blue_block_bottom_of_stack)
      (on blue_block_bottom_of_stack orange_block_single)
    )
  )
)