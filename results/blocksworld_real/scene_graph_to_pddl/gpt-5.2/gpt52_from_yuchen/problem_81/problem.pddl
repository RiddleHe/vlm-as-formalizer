(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow_block_top - block
    purple_block - block
    blue_block - block
    green_block - block
    red_block_bottom - block
    orange_block_separate - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_bottom)
    (ontable orange_block_separate)

    (on green_block red_block_bottom)
    (on blue_block green_block)
    (on purple_block blue_block)
    (on yellow_block_top purple_block)

    (clear yellow_block_top)
    (clear orange_block_separate)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block red_block_bottom)
      (on purple_block yellow_block_top)
      (on blue_block orange_block_separate)
    )
  )
)