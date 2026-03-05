(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block yellow_block blue_block red_block green_block purple_block - block
    robot_arm - robot
  )
  (:init
    ;; relations from scene graph
    (ontable yellow_block)
    (ontable red_block)
    (ontable green_block)
    (ontable purple_block)

    (on orange_block yellow_block)
    (on blue_block red_block)

    (clear orange_block)
    (clear blue_block)
    (clear green_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block yellow_block)
      (on yellow_block blue_block)
      (on orange_block green_block)
      (on green_block purple_block)
    )
  )
)