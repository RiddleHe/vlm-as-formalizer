(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    green_block yellow_block red_block blue_block orange_block purple_block - block
    robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable green_block)
    (ontable yellow_block)
    (ontable red_block)
    (ontable blue_block)

    ;; current stack: purple on orange on blue
    (on orange_block blue_block)
    (on purple_block orange_block)

    ;; clear blocks
    (clear green_block)
    (clear yellow_block)
    (clear red_block)
    (clear purple_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on blue_block purple_block)
      (on yellow_block orange_block)
      (on orange_block red_block)
    )
  )
)