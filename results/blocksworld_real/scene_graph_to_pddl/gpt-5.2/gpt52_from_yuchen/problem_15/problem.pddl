(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_block yellow_block orange_block blue_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (on blue_block purple_block)
    (on orange_block blue_block)
    (on yellow_block orange_block)
    (on green_block yellow_block)
    (clear green_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on blue_block purple_block)
      (on purple_block orange_block)
      (on orange_block green_block)
      (on green_block red_block)
    )
  )
)