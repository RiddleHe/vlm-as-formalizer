(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_top_block green_block red_block purple_block yellow_block blue_bottom_block - block
    white_robot_arm - robot
  )
  (:init
    (ontable blue_bottom_block)
    (on yellow_block blue_bottom_block)
    (on purple_block yellow_block)
    (on red_block purple_block)
    (on green_block red_block)
    (on orange_top_block green_block)
    (clear orange_top_block)
    (handempty white_robot_arm)
  )
  (:goal
    (and
      (on blue_bottom_block orange_top_block)
      (on orange_top_block green_block)
      (on green_block purple_block)
      (on purple_block yellow_block)
      (on yellow_block red_block)
    )
  )
)