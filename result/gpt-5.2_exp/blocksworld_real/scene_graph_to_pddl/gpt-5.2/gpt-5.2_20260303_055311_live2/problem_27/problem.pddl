(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    orange_block green_block blue_block yellow_block red_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable green_block)
    (ontable blue_block)
    (ontable red_block)
    (ontable purple_block)

    (clear orange_block)
    (clear green_block)
    (clear yellow_block)
    (clear red_block)
    (clear purple_block)

    (on yellow_block blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block green_block)
      (on green_block red_block)
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block purple_block)
    )
  )
)