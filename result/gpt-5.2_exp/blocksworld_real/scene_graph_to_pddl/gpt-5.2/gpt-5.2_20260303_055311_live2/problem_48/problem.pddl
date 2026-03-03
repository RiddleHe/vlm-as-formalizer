(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red_block yellow_block green_block purple_block blue_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)

    (on yellow_block green_block)
    (on red_block yellow_block)
    (on blue_block orange_block)
    (on purple_block blue_block)

    (clear red_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block purple_block)
      (on red_block yellow_block)
      (on green_block orange_block)
    )
  )
)