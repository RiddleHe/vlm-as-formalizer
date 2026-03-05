(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_block purple_block red_block green_block yellow_block blue_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable green_block)

    (on purple_block orange_block)
    (on red_block purple_block)
    (on yellow_block green_block)
    (on blue_block yellow_block)

    (clear red_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block blue_block)
      (on red_block green_block)
      (on yellow_block purple_block)
    )
  )
)