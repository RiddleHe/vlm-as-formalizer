(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block orange_block red_block green_block yellow_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable orange_block)
    (ontable yellow_block)

    (clear purple_block)
    (clear blue_block)
    (clear red_block)

    (handempty robot_arm)

    (on blue_block orange_block)
    (on green_block yellow_block)
    (on red_block green_block)
  )
  (:goal
    (and
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block blue_block)
      (ontable blue_block)

      (on green_block purple_block)
      (ontable purple_block)
    )
  )
)