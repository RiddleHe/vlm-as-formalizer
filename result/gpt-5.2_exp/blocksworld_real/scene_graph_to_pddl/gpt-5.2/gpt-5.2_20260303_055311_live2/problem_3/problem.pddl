(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block red_block orange_block blue_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (on blue_block green_block)
    (on orange_block blue_block)
    (on red_block orange_block)
    (on yellow_block red_block)
    (on purple_block yellow_block)
    (clear purple_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block red_block)
      (on yellow_block orange_block)
      (on orange_block green_block)
      (on green_block blue_block)
    )
  )
)