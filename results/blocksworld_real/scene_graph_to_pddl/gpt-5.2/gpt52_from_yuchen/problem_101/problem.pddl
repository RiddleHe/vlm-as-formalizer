(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    orange_block red_block yellow_block purple_block green_block blue_block - block
    robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable red_block)
    (ontable purple_block)
    (ontable blue_block)

    ;; current stacks
    (on orange_block red_block)
    (on yellow_block purple_block)
    (on green_block blue_block)

    ;; clear blocks (nothing on top)
    (clear orange_block)
    (clear yellow_block)
    (clear green_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on red_block green_block)
      (on blue_block purple_block)
    )
  )
)