(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    red_block blue_block orange_block yellow_block green_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable purple_block)
    (ontable blue_block)

    (clear orange_block)
    (clear yellow_block)
    (clear green_block)
    (clear purple_block)
    (clear red_block)

    (handempty robot_arm)

    (on red_block blue_block)
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on orange_block purple_block)
      (on purple_block yellow_block)
      (on yellow_block green_block)
      (on green_block red_block)
    )
  )
)