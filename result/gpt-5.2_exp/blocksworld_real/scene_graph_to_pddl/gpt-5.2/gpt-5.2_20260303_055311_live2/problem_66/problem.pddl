(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block yellow_block red_block green_block orange_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (on yellow_block blue_block)
    (on red_block yellow_block)
    (on green_block red_block)

    (ontable orange_block)
    (on purple_block orange_block)

    (clear green_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block green_block)
      (on red_block blue_block)
      (on blue_block purple_block)
      (on purple_block yellow_block)
    )
  )
)