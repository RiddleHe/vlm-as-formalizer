(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block green_block yellow_block orange_block purple_block blue_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)
    (ontable purple_block)
    (ontable blue_block)

    (on red_block green_block)
    (on yellow_block orange_block)

    (clear red_block)
    (clear yellow_block)
    (clear purple_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block orange_block)
      (on orange_block purple_block)
      (on purple_block blue_block)
      (on yellow_block red_block)
    )
  )
)