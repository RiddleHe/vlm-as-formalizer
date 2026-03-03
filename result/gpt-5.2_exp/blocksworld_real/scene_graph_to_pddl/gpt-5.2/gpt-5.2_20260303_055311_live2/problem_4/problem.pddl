(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green_bottom_block yellow_block blue_block purple_block red_block orange_top_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_bottom_block)
    (on yellow_block green_bottom_block)
    (on blue_block yellow_block)
    (on purple_block blue_block)
    (on red_block purple_block)
    (on orange_top_block red_block)
    (clear orange_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block green_bottom_block)
      (on blue_block red_block)
      (on red_block orange_top_block)
      (on orange_top_block yellow_block)
    )
  )
)