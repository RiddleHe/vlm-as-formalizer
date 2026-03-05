(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    purple_block blue_block red_block orange_block yellow_block green_block - block
    robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable purple_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable orange_block)
    (ontable blue_block)

    ;; existing stack
    (on red_block blue_block)

    ;; clear conditions
    (clear purple_block)
    (clear yellow_block)
    (clear green_block)
    (clear orange_block)
    (clear red_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block green_block)
      (on yellow_block purple_block)
      (on blue_block orange_block)
    )
  )
)