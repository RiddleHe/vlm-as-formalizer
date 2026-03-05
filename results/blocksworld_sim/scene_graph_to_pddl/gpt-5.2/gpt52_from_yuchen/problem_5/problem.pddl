(define (problem blocksworld_stack_1)
  (:domain blocksworld)
  (:objects
    green_block orange_block blue_block red_block yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (on red_block yellow_block)
    (on blue_block red_block)
    (on orange_block blue_block)
    (on green_block orange_block)
    (clear green_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block red_block)
      (on red_block blue_block)
      (on blue_block orange_block)
      (on orange_block green_block)
    )
  )
)