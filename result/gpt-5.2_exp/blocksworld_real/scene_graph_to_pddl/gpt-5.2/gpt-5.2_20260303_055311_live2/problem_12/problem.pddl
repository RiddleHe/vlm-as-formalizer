(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple_block_top - block
    green_block_upper - block
    yellow_block_middle - block
    blue_block_lower - block
    orange_block_lower - block
    red_block_bottom - block
    robot_arm - robot
  )

  (:init
    (ontable red_block_bottom)

    (on orange_block_lower red_block_bottom)
    (on blue_block_lower orange_block_lower)
    (on yellow_block_middle blue_block_lower)
    (on green_block_upper yellow_block_middle)
    (on purple_block_top green_block_upper)

    (clear purple_block_top)

    (handempty robot_arm)
  )

  (:goal
    (and
      (on yellow_block_middle orange_block_lower)
      (on purple_block_top green_block_upper)
      (on red_block_bottom blue_block_lower)
    )
  )
)