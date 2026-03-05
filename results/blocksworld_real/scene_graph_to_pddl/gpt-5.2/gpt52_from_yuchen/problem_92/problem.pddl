(define (problem blocksworld_two_stacks_1)
  (:domain blocksworld)
  (:objects
    orange_block_top red_block_second purple_block_third yellow_block_fourth green_block_fifth blue_block_bottom - block
    robot_arm_1 - robot
  )
  (:init
    (ontable blue_block_bottom)
    (on green_block_fifth blue_block_bottom)
    (on yellow_block_fourth green_block_fifth)
    (on purple_block_third yellow_block_fourth)
    (on red_block_second purple_block_third)
    (on orange_block_top red_block_second)
    (clear orange_block_top)
    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on red_block_second green_block_fifth)
      (on green_block_fifth purple_block_third)
      (on orange_block_top blue_block_bottom)
      (on blue_block_bottom yellow_block_fourth)
    )
  )
)