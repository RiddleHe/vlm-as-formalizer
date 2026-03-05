(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    green_top_block yellow_second_block purple_third_block
    red_fourth_block orange_fifth_block blue_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_bottom_block)

    (on orange_fifth_block blue_bottom_block)
    (on red_fourth_block orange_fifth_block)
    (on purple_third_block red_fourth_block)
    (on yellow_second_block purple_third_block)
    (on green_top_block yellow_second_block)

    (clear green_top_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_third_block green_top_block)
      (on orange_fifth_block red_fourth_block)
      (on blue_bottom_block yellow_second_block)
    )
  )
)