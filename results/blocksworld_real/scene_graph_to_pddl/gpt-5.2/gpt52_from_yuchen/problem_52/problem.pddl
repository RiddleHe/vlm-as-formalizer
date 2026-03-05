(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow_block red_block orange_block purple_block green_block blue_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable green_block)
    (ontable blue_block)

    (on yellow_block red_block)
    (on red_block orange_block)
    (on purple_block green_block)

    (clear yellow_block)
    (clear purple_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block green_block)
      (on yellow_block red_block)
      (on orange_block blue_block)
    )
  )
)