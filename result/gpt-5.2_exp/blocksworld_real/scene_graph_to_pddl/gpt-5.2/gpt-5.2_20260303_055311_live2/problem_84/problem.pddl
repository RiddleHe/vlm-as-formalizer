(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_block blue_block yellow_block orange_block red_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable blue_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable red_block)
    (on purple_block red_block)

    (clear green_block)
    (clear blue_block)
    (clear yellow_block)
    (clear orange_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on blue_block red_block)
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block purple_block)
    )
  )
)