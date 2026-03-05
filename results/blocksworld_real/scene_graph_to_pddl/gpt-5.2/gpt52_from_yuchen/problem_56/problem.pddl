(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow_block red_block orange_block blue_block green_block purple_block - block
    robot_arm - robot
  )
  (:init
    (on yellow_block red_block)
    (on orange_block blue_block)

    (ontable red_block)
    (ontable blue_block)
    (ontable green_block)
    (ontable purple_block)

    (clear yellow_block)
    (clear orange_block)
    (clear green_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on orange_block red_block)
      (on yellow_block purple_block)
    )
  )
)