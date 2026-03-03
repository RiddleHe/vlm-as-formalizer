(define (problem blocksworld_stack_task)
  (:domain blocksworld)
  (:objects
    green_top_block - block
    yellow_second_block - block
    orange_third_block - block
    blue_fourth_block - block
    purple_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_bottom_block)
    (on blue_fourth_block purple_bottom_block)
    (on orange_third_block blue_fourth_block)
    (on yellow_second_block orange_third_block)
    (on green_top_block yellow_second_block)
    (clear green_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_second_block blue_fourth_block)
      (on blue_fourth_block purple_bottom_block)
      (on purple_bottom_block orange_third_block)
      (on orange_third_block green_top_block)
      (on green_top_block red_block)
    )
  )
)