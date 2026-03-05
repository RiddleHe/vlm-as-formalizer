(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block yellow_block purple_block blue_block green_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)

    (on red_block yellow_block)
    (on yellow_block purple_block)
    (on purple_block blue_block)
    (on blue_block green_block)

    (clear red_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on purple_block red_block)
      (on red_block green_block)
      (on green_block orange_block)
    )
  )
)