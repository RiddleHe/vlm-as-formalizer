(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    purple_block green_block yellow_block blue_block red_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable green_block)
    (ontable yellow_block)
    (ontable blue_block)
    (ontable red_block)
    (ontable orange_block)

    (clear purple_block)
    (clear green_block)
    (clear yellow_block)
    (clear blue_block)
    (clear red_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block green_block)
      (on red_block yellow_block)
      (on orange_block blue_block)
    )
  )
)