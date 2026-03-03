(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block purple_block blue_block orange_block green_block yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (ontable orange_block)
    (ontable green_block)
    (ontable yellow_block)

    (on red_block purple_block)
    (on purple_block blue_block)

    (clear red_block)
    (clear orange_block)
    (clear green_block)
    (clear yellow_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block red_block)
      (on yellow_block purple_block)
      (on purple_block blue_block)
      (on blue_block orange_block)
    )
  )
)