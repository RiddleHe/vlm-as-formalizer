(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple_block_bottom blue_block_above_purple green_block_above_blue
    yellow_block_above_green red_block_above_yellow orange_block_top - block
    robot_arm_1 - robot
  )
  (:init
    (ontable purple_block_bottom)
    (on blue_block_above_purple purple_block_bottom)
    (on green_block_above_blue blue_block_above_purple)
    (on yellow_block_above_green green_block_above_blue)
    (on red_block_above_yellow yellow_block_above_green)
    (on orange_block_top red_block_above_yellow)
    (clear orange_block_top)
    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on green_block_above_blue blue_block_above_purple)
      (on purple_block_bottom orange_block_top)
      (on red_block_above_yellow yellow_block_above_green)
    )
  )
)