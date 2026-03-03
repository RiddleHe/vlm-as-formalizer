(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_block purple_block yellow_block
    green_block red_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (ontable orange_block)

    (on blue_block purple_block)
    (on purple_block yellow_block)
    (on green_block red_block)
    (on red_block orange_block)

    (clear blue_block)
    (clear green_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block yellow_block)
      (on orange_block red_block)
      (on red_block purple_block)
      (on purple_block green_block)
    )
  )
)