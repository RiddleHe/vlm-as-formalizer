(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_top_block yellow_second_block red_third_block orange_fourth_block green_bottom_block purple_single_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_bottom_block)
    (ontable purple_single_block)

    (on blue_top_block yellow_second_block)
    (on yellow_second_block red_third_block)
    (on red_third_block orange_fourth_block)
    (on orange_fourth_block green_bottom_block)

    (clear blue_top_block)
    (clear purple_single_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_third_block blue_top_block)
      (on yellow_second_block green_bottom_block)
      (on green_bottom_block orange_fourth_block)
      (on orange_fourth_block purple_single_block)
    )
  )
)