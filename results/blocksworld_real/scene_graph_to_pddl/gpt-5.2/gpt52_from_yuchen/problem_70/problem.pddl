(define (problem blocksworld_scene_1)
  (:domain blocksworld)

  (:objects
    purple_block yellow_block blue_block green_block orange_block red_block - block
    robot_arm - robot
  )

  (:init
    (ontable purple_block)
    (ontable red_block)

    (on yellow_block purple_block)
    (on blue_block yellow_block)
    (on green_block blue_block)
    (on orange_block green_block)

    (clear green_block)
    (clear red_block)

    (handempty robot_arm)
  )

  (:goal
    (and
      (on yellow_block red_block)
      (on red_block orange_block)
      (on orange_block blue_block)
      (on blue_block purple_block)
      (on purple_block green_block)
    )
  )
)