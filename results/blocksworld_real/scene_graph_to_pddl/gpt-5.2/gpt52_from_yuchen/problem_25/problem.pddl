(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue_block orange_block purple_block yellow_block red_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable purple_block)
    (ontable green_block)

    (on blue_block orange_block)
    (on red_block green_block)
    (on yellow_block red_block)

    (clear blue_block)
    (clear purple_block)
    (clear yellow_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block red_block)
      (on red_block yellow_block)
      (on blue_block purple_block)
      (on purple_block green_block)
    )
  )
)