(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_single_block green_separate_block orange_bottom_block blue_middle_block yellow_upper_block purple_top_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_single_block)
    (ontable orange_bottom_block)
    (ontable green_separate_block)

    (on blue_middle_block orange_bottom_block)
    (on yellow_upper_block blue_middle_block)
    (on purple_top_block yellow_upper_block)

    (clear red_single_block)
    (clear purple_top_block)
    (clear green_separate_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_single_block green_separate_block)
      (on orange_bottom_block blue_middle_block)
      (on blue_middle_block purple_top_block)
      (on purple_top_block yellow_upper_block)
    )
  )
)