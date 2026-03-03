(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    yellow_block red_block orange_block purple_block blue_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (ontable orange_block)
    (ontable purple_block)
    (ontable blue_block)
    (ontable green_block)

    (on red_block yellow_block)

    (clear red_block)
    (clear orange_block)
    (clear purple_block)
    (clear blue_block)
    (clear green_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block purple_block)
      (on blue_block red_block)
      (on orange_block green_block)
    )
  )
)