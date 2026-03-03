(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple_block green_block red_block orange_block blue_block yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable green_block)
    (ontable orange_block)
    (ontable yellow_block)

    (on red_block orange_block)
    (on blue_block yellow_block)

    (clear purple_block)
    (clear green_block)
    (clear red_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block blue_block)
      (on red_block orange_block)
      (on yellow_block green_block)
    )
  )
)