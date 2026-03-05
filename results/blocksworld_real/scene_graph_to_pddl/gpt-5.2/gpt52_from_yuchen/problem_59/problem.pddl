(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow_single_block red_single_block purple_top_block orange_bottom_block blue_top_block green_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_single_block)
    (ontable red_single_block)
    (ontable orange_bottom_block)
    (ontable green_bottom_block)

    (on purple_top_block orange_bottom_block)
    (on blue_top_block green_bottom_block)

    (clear yellow_single_block)
    (clear red_single_block)
    (clear purple_top_block)
    (clear blue_top_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_single_block blue_top_block)
      (on orange_bottom_block purple_top_block)
      (on red_single_block green_bottom_block)
    )
  )
)