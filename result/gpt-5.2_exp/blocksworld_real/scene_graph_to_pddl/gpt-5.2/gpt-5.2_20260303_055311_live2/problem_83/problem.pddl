(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_top_block - block
    blue_upper_block - block
    yellow_middle_block - block
    red_lower_block - block
    purple_bottom_block - block
    orange_single_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (ontable orange_single_block)

    (on red_lower_block purple_bottom_block)
    (on yellow_middle_block red_lower_block)
    (on blue_upper_block yellow_middle_block)
    (on green_top_block blue_upper_block)

    (clear green_top_block)
    (clear orange_single_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_bottom_block red_lower_block)
      (on red_lower_block blue_upper_block)
      (on blue_upper_block orange_single_block)
      (on orange_single_block yellow_middle_block)
      (on yellow_middle_block green_top_block)
    )
  )
)