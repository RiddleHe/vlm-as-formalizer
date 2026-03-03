(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block green_block red_block blue_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (on purple_block blue_block)
    (on orange_block purple_block)
    (on red_block orange_block)
    (on green_block red_block)
    (on yellow_block green_block)
    (clear yellow_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block yellow_block)
      (on green_block red_block)
      (on blue_block orange_block)
    )
  )
)