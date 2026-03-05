(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    red_block blue_block purple_block green_block yellow_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_block)
    (ontable green_block)
    (ontable yellow_block)

    (on blue_block red_block)
    (on purple_block blue_block)
    (on orange_block yellow_block)

    (clear purple_block)
    (clear green_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block green_block)
      (on green_block purple_block)
      (on purple_block blue_block)
    )
  )
)