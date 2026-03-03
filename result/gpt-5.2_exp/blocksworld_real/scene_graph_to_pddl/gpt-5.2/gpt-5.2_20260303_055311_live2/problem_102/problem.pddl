(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    green_top_block red_block blue_block yellow_block purple_block orange_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_bottom_block)
    (on purple_block orange_bottom_block)
    (on yellow_block purple_block)
    (on blue_block yellow_block)
    (on red_block blue_block)
    (on green_top_block red_block)
    (clear green_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_top_block red_block)
      (on red_block orange_bottom_block)
      (on orange_bottom_block blue_block)
      (on blue_block purple_block)
      (on purple_block yellow_block)
    )
  )
)