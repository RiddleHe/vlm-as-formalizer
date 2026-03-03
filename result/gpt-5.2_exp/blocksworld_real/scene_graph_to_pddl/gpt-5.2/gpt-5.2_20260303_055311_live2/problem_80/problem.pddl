(define (problem blocksworld_stacks3)
  (:domain blocksworld)
  (:objects
    yellow_block green_block red_block blue_block purple_block orange_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (ontable green_block)
    (ontable red_block)
    (ontable blue_block)
    (ontable purple_block)
    (ontable orange_block)

    (clear yellow_block)
    (clear green_block)
    (clear red_block)
    (clear blue_block)
    (clear purple_block)
    (clear orange_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block green_block)
      (on red_block blue_block)
      (on purple_block orange_block)
    )
  )
)