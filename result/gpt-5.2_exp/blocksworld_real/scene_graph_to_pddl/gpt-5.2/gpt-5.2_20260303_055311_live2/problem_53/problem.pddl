(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue_block orange_block yellow_block green_block red_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable green_block)
    (ontable purple_block)

    (on blue_block orange_block)
    (on yellow_block green_block)
    (on red_block purple_block)

    (clear blue_block)
    (clear yellow_block)
    (clear red_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block yellow_block)
      (on green_block blue_block)
      (on purple_block red_block)
    )
  )
)