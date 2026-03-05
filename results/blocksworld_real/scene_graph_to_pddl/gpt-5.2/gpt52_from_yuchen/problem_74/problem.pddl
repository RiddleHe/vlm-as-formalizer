(define (problem blocksworld_scene_01)
  (:domain blocksworld)
  (:objects
    yellow_block orange_block blue_block red_block green_block purple_block - block
    robot_arm - robot
  )

  (:init
    (ontable orange_block)
    (ontable blue_block)
    (ontable purple_block)

    (on yellow_block orange_block)
    (on green_block purple_block)
    (on red_block green_block)

    (clear yellow_block)
    (clear blue_block)
    (clear red_block)

    (handempty robot_arm)
  )

  (:goal
    (and
      (on yellow_block green_block)
      (on green_block purple_block)
      (on purple_block red_block)
      (on red_block blue_block)
      (on blue_block orange_block)
    )
  )
)