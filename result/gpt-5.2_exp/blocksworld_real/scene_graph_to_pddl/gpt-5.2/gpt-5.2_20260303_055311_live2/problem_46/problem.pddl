(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    red_block_top yellow_block_second orange_block_third purple_block_fourth blue_block_fifth green_block_bottom - block
    robot_arm - robot
  )
  (:init
    (ontable green_block_bottom)

    (on blue_block_fifth green_block_bottom)
    (on purple_block_fourth blue_block_fifth)
    (on orange_block_third purple_block_fourth)
    (on yellow_block_second orange_block_third)
    (on red_block_top yellow_block_second)

    (clear red_block_top)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block_second green_block_bottom)
      (on blue_block_fifth purple_block_fourth)
      (on orange_block_third red_block_top)
    )
  )
)