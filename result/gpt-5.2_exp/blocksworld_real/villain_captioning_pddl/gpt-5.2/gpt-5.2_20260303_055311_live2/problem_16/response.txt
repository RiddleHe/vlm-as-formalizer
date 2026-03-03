(define (problem blocksworld_scene_stack1)
  (:domain blocksworld)
  (:objects
    blue_block orange_block purple_block yellow_block red_block green_block - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Left 3-block tower
    (ontable blue_block)
    (on orange_block blue_block)
    (on purple_block orange_block)
    (clear purple_block)

    ;; Middle 2-block tower
    (ontable yellow_block)
    (on red_block yellow_block)
    (clear red_block)

    ;; Single green block
    (ontable green_block)
    (clear green_block)
  )
  (:goal
    (and
      (on green_block red_block)
      (on red_block orange_block)
      (on orange_block purple_block)
      (on purple_block blue_block)
      (on blue_block yellow_block)
      (ontable yellow_block)
    )
  )
)