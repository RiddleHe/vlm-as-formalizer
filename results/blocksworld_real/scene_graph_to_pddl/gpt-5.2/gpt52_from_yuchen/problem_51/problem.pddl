(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block orange_block blue_block green_block red_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable green_block)
    (ontable red_block)

    (on blue_block orange_block)

    (clear purple_block)
    (clear yellow_block)
    (clear blue_block)
    (clear green_block)
    (clear red_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block purple_block)
      (on purple_block red_block)
      (on red_block yellow_block)
      (on green_block blue_block)
    )
  )
)