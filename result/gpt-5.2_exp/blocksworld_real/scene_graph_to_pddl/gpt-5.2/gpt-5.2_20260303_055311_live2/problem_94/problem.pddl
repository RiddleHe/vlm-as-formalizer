(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_block orange_block red_block yellow_block blue_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)
    (ontable red_block)
    (ontable blue_block)

    (on yellow_block red_block)
    (on purple_block blue_block)

    (clear green_block)
    (clear orange_block)
    (clear yellow_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (ontable green_block)
      (on orange_block green_block)
      (on yellow_block orange_block)
      (on blue_block yellow_block)
      (on red_block blue_block)
      (on purple_block red_block)
    )
  )
)