(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple_block blue_block red_block orange_block green_block yellow_block - block
    robot_arm - robot
  )
  (:init
    ;; block positions
    (ontable purple_block)
    (ontable orange_block)
    (ontable green_block)
    (ontable yellow_block)

    (on red_block blue_block)
    (on blue_block orange_block)

    ;; clear blocks
    (clear purple_block)
    (clear red_block)
    (clear orange_block)
    (clear green_block)
    (clear yellow_block)

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