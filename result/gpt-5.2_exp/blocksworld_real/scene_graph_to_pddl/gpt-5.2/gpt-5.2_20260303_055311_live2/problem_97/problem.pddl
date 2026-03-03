(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    blue_block orange_block green_block red_block yellow_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (ontable orange_block)
    (ontable green_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable purple_block)

    (clear blue_block)
    (clear orange_block)
    (clear green_block)
    (clear red_block)
    (clear yellow_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on green_block red_block)
      (on yellow_block purple_block)
    )
  )
)