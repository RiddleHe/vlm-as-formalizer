(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    orange_top_block red_block yellow_block purple_block green_block blue_block - block
    robot_arm - robot
  )
  (:init
    (handempty robot_arm)
    (ontable blue_block)
    (clear orange_top_block)
    (on orange_top_block red_block)
    (on red_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block green_block)
    (on green_block blue_block)
  )
  (:goal
    (and
      (on orange_top_block purple_block)
      (on purple_block green_block)
      (on green_block blue_block)
      (on blue_block yellow_block)
      (on yellow_block red_block)
    )
  )
)