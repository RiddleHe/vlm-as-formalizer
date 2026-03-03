(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange_top_block green_second_block red_third_block purple_fourth_block yellow_fifth_block blue_bottom_block - block
    white_robot_arm - robot
  )
  (:init
    (ontable blue_bottom_block)

    (on orange_top_block green_second_block)
    (on green_second_block red_third_block)
    (on red_third_block purple_fourth_block)
    (on purple_fourth_block yellow_fifth_block)
    (on yellow_fifth_block blue_bottom_block)

    (clear orange_top_block)

    (handempty white_robot_arm)
  )
  (:goal
    (and
      (on blue_bottom_block orange_top_block)
      (on orange_top_block green_second_block)
      (on green_second_block purple_fourth_block)
      (on purple_fourth_block yellow_fifth_block)
      (on yellow_fifth_block red_third_block)
      (ontable red_third_block)
    )
  )
)