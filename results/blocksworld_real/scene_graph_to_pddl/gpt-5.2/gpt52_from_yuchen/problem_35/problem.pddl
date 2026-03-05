(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    purple_block red_block orange_block blue_block yellow_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable red_block)
    (ontable blue_block)
    (ontable yellow_block)
    (ontable green_block)

    (on orange_block blue_block)

    (clear purple_block)
    (clear red_block)
    (clear orange_block)
    (clear yellow_block)
    (clear green_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block red_block)
      (on red_block blue_block)
      (on blue_block green_block)
    )
  )
)