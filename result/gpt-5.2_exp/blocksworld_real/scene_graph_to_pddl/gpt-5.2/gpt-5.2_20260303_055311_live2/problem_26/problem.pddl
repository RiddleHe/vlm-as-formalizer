(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    orange_top_block red_block yellow_block green_block blue_block purple_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (on blue_block purple_bottom_block)
    (on green_block blue_block)
    (on yellow_block green_block)
    (on red_block yellow_block)
    (on orange_top_block red_block)
    (clear orange_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on purple_bottom_block orange_top_block)
      (on red_block yellow_block)
    )
  )
)