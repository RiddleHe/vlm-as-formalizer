(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    purple_block green_block blue_block yellow_block red_block orange_block - block
    robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable purple_block)
    (ontable green_block)
    (ontable blue_block)
    (ontable yellow_block)

    ;; existing stack
    (on red_block yellow_block)
    (on orange_block red_block)

    ;; clear blocks
    (clear purple_block)
    (clear green_block)
    (clear blue_block)
    (clear orange_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block purple_block)
      (on purple_block yellow_block)
      (on orange_block blue_block)
      (on blue_block green_block)
    )
  )
)