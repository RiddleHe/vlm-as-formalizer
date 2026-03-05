(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    yellow_top_block green_middle_block purple_bottom_block
    red_top_block orange_middle_block blue_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (ontable blue_bottom_block)

    (on green_middle_block purple_bottom_block)
    (on yellow_top_block green_middle_block)

    (on orange_middle_block blue_bottom_block)
    (on red_top_block orange_middle_block)

    (clear yellow_top_block)
    (clear red_top_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_top_block yellow_top_block)
      (on yellow_top_block orange_middle_block)

      (on green_middle_block blue_bottom_block)
      (on blue_bottom_block purple_bottom_block)
    )
  )
)