(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_top_block blue_block purple_block red_bottom_block green_block yellow_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_bottom_block)
    (ontable yellow_bottom_block)

    (on orange_top_block blue_block)
    (on blue_block purple_block)
    (on purple_block red_bottom_block)
    (on green_block yellow_bottom_block)

    (clear orange_top_block)
    (clear green_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block red_bottom_block)
      (on red_bottom_block purple_block)
      (on purple_block blue_block)
      (on blue_block orange_top_block)
      (on orange_top_block yellow_bottom_block)
    )
  )
)