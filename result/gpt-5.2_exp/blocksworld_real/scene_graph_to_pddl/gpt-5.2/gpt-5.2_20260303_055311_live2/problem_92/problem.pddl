(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block red_block purple_block yellow_block green_block blue_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (on green_block blue_block)
    (on yellow_block green_block)
    (on purple_block yellow_block)
    (on red_block purple_block)
    (on orange_block red_block)
    (clear orange_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block green_block)
      (on green_block purple_block)
      (on orange_block blue_block)
      (on blue_block yellow_block)
    )
  )
)