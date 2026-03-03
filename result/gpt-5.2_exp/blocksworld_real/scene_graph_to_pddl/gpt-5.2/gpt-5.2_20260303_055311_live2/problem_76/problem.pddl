(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_top_block - block
    yellow_second_block - block
    purple_third_block - block
    green_fourth_block - block
    blue_fifth_block - block
    red_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_bottom_block)
    (on blue_fifth_block red_bottom_block)
    (on green_fourth_block blue_fifth_block)
    (on purple_third_block green_fourth_block)
    (on yellow_second_block purple_third_block)
    (on orange_top_block yellow_second_block)
    (clear orange_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_bottom_block purple_third_block)
      (on yellow_second_block green_fourth_block)
      (on green_fourth_block orange_top_block)
      (on orange_top_block blue_fifth_block)
    )
  )
)