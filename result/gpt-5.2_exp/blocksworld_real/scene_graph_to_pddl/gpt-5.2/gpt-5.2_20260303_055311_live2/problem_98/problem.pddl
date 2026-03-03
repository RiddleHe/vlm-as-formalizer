(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow_block_top purple_block_second green_block_third red_block_fourth blue_block_fifth orange_block_bottom - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block_bottom)
    (on blue_block_fifth orange_block_bottom)
    (on red_block_fourth blue_block_fifth)
    (on green_block_third red_block_fourth)
    (on purple_block_second green_block_third)
    (on yellow_block_top purple_block_second)
    (clear yellow_block_top)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block_bottom red_block_fourth)
      (on yellow_block_top blue_block_fifth)
      (on purple_block_second green_block_third)
    )
  )
)