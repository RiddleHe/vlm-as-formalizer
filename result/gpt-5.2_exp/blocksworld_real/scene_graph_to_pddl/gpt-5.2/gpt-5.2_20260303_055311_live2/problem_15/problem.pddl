(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    green_top_block - block
    yellow_block - block
    orange_red_block - block
    blue_block - block
    purple_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (clear green_top_block)
    (handempty robot_arm)

    (on green_top_block yellow_block)
    (on yellow_block orange_red_block)
    (on orange_red_block blue_block)
    (on blue_block purple_bottom_block)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on blue_block purple_bottom_block)
      (on purple_bottom_block orange_red_block)
      (on orange_red_block green_top_block)
      (on green_top_block orange_red_block)
    )
  )
)