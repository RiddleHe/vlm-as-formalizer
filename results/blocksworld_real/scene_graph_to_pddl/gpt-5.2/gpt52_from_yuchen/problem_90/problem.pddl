(define (problem blocksworld_scene_01)
  (:domain blocksworld)
  (:objects
    blue_block yellow_block orange_block green_block red_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)

    (on red_block purple_block)
    (on green_block red_block)
    (on orange_block green_block)
    (on yellow_block orange_block)
    (on blue_block yellow_block)

    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block blue_block)
      (on orange_block yellow_block)
      (on purple_block green_block)
    )
  )
)