(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    green_block red_block blue_block orange_block purple_block yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_block)
    (ontable yellow_block)

    (on green_block red_block)
    (on purple_block yellow_block)
    (on orange_block purple_block)
    (on blue_block orange_block)

    (clear green_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block red_block)
      (on orange_block purple_block)
      (on blue_block yellow_block)
    )
  )
)