(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_top_block red_block yellow_block orange_block purple_bottom_block blue_single_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (ontable blue_single_block)

    (on green_top_block red_block)
    (on red_block yellow_block)
    (on yellow_block orange_block)
    (on orange_block purple_bottom_block)

    (clear green_top_block)
    (clear blue_single_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_single_block purple_bottom_block)
      (on purple_bottom_block green_top_block)
      (on green_top_block red_block)
      (on red_block yellow_block)
      (on yellow_block orange_block)
    )
  )
)