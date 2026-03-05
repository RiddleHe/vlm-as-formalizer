(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    green_block orange_block yellow_block red_block blue_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)
    (ontable yellow_block)
    (ontable red_block)
    (ontable blue_block)

    (clear green_block)
    (clear orange_block)
    (clear yellow_block)
    (clear red_block)
    (clear purple_block)

    (handempty robot_arm)

    (on purple_block blue_block)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on blue_block red_block)
      (on green_block purple_block)
    )
  )
)