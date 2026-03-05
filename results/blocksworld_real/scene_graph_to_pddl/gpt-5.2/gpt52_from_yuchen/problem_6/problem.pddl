(define (problem blocksworld-stack1)
  (:domain blocksworld)
  (:objects
    blue_block purple_block orange_block yellow_block red_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable blue_block)
    (ontable orange_block)
    (ontable yellow_block)
    (ontable red_block)

    (clear blue_block)
    (clear orange_block)
    (clear yellow_block)
    (clear red_block)

    (handempty robot_arm)

    (on blue_block purple_block)
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on orange_block red_block)
      (on red_block purple_block)
      (on purple_block yellow_block)
    )
  )
)