(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block blue_block yellow_block purple_block green_block red_block - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable blue_block)
    (ontable yellow_block)
    (ontable purple_block)
    (ontable green_block)
    (ontable red_block)

    (clear orange_block)
    (clear blue_block)
    (clear yellow_block)
    (clear purple_block)
    (clear green_block)
    (clear red_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block blue_block)
      (on blue_block yellow_block)
      (on yellow_block orange_block)
      (on green_block red_block)
    )
  )
)