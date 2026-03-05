(define (problem blocksworld_stacks3)
  (:domain blocksworld)
  (:objects
    purple_top_block green_block yellow_block blue_block orange_block red_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_bottom_block)
    (on orange_block red_bottom_block)
    (on blue_block orange_block)
    (on yellow_block blue_block)
    (on green_block yellow_block)
    (on purple_top_block green_block)
    (clear purple_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on purple_top_block green_block)
      (on red_bottom_block blue_block)
    )
  )
)