(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue_top_block orange_second_block green_middle_block purple_lower_block yellow_bottom_block red_single_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_bottom_block)
    (ontable red_single_block)

    (on blue_top_block orange_second_block)
    (on orange_second_block green_middle_block)
    (on green_middle_block purple_lower_block)
    (on purple_lower_block yellow_bottom_block)

    (clear blue_top_block)
    (clear red_single_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_second_block purple_lower_block)
      (on purple_lower_block blue_top_block)
      (on yellow_bottom_block red_single_block)
      (on red_single_block green_middle_block)
    )
  )
)