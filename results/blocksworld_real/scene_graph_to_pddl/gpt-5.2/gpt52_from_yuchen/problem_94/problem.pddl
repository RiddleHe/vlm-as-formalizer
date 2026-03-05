(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green_block orange_block red_block yellow_block blue_block purple_block - block
    robot_arm - robot
  )

  (:init
    ;; blocks on table
    (ontable green_block)
    (ontable orange_block)
    (ontable red_block)
    (ontable blue_block)

    ;; stacks present
    (on yellow_block red_block)
    (on purple_block blue_block)

    ;; clear blocks
    (clear green_block)
    (clear orange_block)
    (clear yellow_block)
    (clear purple_block)

    ;; robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      (on orange_block green_block)
      (on yellow_block orange_block)
      (on blue_block yellow_block)
      (on red_block blue_block)
      (on purple_block red_block)
    )
  )
)