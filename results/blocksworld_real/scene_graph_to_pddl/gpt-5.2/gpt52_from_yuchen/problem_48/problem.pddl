(define (problem blocksworld_stacks_01)
  (:domain blocksworld)
  (:objects
    red_block yellow_block green_block
    purple_block blue_block orange_block - block
    robot_arm - robot
  )
  (:init
    ;; left stack
    (ontable green_block)
    (on yellow_block green_block)
    (on red_block yellow_block)

    ;; right stack
    (ontable orange_block)
    (on blue_block orange_block)
    (on purple_block blue_block)

    ;; clear blocks
    (clear red_block)
    (clear purple_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block purple_block)
      (on red_block yellow_block)
      (on green_block orange_block)
    )
  )
)