(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_bottom blue_block_above_red green_block_above_blue
    purple_block_above_green yellow_block_above_purple orange_block_top - block
    robot_arm - robot
  )

  (:init
    (ontable red_block_bottom)
    (on blue_block_above_red red_block_bottom)
    (on green_block_above_blue blue_block_above_red)
    (on purple_block_above_green green_block_above_blue)
    (on yellow_block_above_purple purple_block_above_green)
    (on orange_block_top yellow_block_above_purple)
    (clear orange_block_top)
    (handempty robot_arm)
  )

  (:goal
    (and
      (on red_block_bottom purple_block_above_green)
      (on yellow_block_above_purple green_block_above_blue)
      (on green_block_above_blue orange_block_top)
      (on orange_block_top blue_block_above_red)
    )
  )
)