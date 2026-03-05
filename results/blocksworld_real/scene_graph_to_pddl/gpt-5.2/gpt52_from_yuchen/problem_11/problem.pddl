(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block blue_block red_block green_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (ontable green_block)
    (ontable orange_block)

    (on purple_block yellow_block)
    (on red_block green_block)
    (on blue_block red_block)

    (clear purple_block)
    (clear blue_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on blue_block purple_block)
      (on purple_block orange_block)
      (on red_block yellow_block)
    )
  )
)