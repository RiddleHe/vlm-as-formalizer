(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange_block red_block green_block purple_block yellow_block blue_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable blue_block)
    (on red_block green_block)
    (on orange_block red_block)
    (on yellow_block blue_block)
    (on purple_block yellow_block)
    (clear orange_block)
    (clear purple_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block yellow_block)
      (on yellow_block orange_block)
      (on blue_block red_block)
      (on red_block green_block)
    )
  )
)