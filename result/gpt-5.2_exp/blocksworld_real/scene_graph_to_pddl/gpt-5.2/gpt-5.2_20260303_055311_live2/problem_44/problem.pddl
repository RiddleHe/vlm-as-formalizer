(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    blue_top_block red_block orange_block purple_block green_block yellow_bottom_block - block
    robot_arm - robot
  )
  (:init
    ;; robot state
    (handempty robot_arm)

    ;; blocks configuration from the scene graph
    (ontable yellow_bottom_block)
    (on green_block yellow_bottom_block)
    (on purple_block green_block)
    (on orange_block purple_block)
    (on red_block orange_block)
    (on blue_top_block red_block)

    ;; clear facts
    (clear blue_top_block)
  )
  (:goal
    (and
      (on red_block blue_top_block)
      (on blue_top_block green_block)
      (on green_block yellow_bottom_block)
      (on yellow_bottom_block orange_block)
      (on orange_block purple_block)
    )
  )
)