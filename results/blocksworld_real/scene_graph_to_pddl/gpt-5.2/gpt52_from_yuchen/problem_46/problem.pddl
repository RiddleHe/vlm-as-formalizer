(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red_block yellow_block orange_block purple_block blue_block green_block - block
    robot_arm - robot
  )
  (:init
    ;; stack in the scene (bottom to top)
    (ontable green_block)
    (on blue_block green_block)
    (on purple_block blue_block)
    (on orange_block purple_block)
    (on yellow_block orange_block)
    (on red_block yellow_block)

    ;; only the top block is clear
    (clear red_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block green_block)
      (on blue_block purple_block)
      (on orange_block red_block)
    )
  )
)