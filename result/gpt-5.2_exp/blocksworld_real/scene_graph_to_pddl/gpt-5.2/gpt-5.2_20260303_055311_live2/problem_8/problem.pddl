(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    green_block purple_block blue_block yellow_block red_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable purple_block)
    (ontable blue_block)
    (ontable yellow_block)
    (ontable red_block)
    (ontable orange_block)

    (clear green_block)
    (clear purple_block)
    (clear blue_block)
    (clear yellow_block)
    (clear red_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on blue_block purple_block)
      (on red_block orange_block)
      (on orange_block green_block)
    )
  )
)