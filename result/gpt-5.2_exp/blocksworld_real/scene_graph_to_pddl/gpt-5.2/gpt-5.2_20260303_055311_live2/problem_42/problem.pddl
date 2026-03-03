(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    green_block_top - block
    yellow_block_second - block
    purple_block_third - block
    red_block_fourth - block
    orange_block_fifth - block
    blue_block_bottom - block
    robot_arm - robot
  )

  (:init
    (ontable blue_block_bottom)

    (on orange_block_fifth blue_block_bottom)
    (on red_block_fourth orange_block_fifth)
    (on purple_block_third red_block_fourth)
    (on yellow_block_second purple_block_third)
    (on green_block_top yellow_block_second)

    (clear green_block_top)
    (handempty robot_arm)
  )

  (:goal
    (and
      (on purple_block_third green_block_top)
      (on orange_block_fifth red_block_fourth)
      (on blue_block_bottom yellow_block_second)
    )
  )
)