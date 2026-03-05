(define (problem blocksworld-stack1)
  (:domain blocksworld)
  (:objects
    red_block orange_block blue_block yellow_block green_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_block)
    (ontable orange_block)
    (ontable blue_block)
    (ontable green_block)
    (ontable purple_block)

    (on yellow_block green_block)

    (clear red_block)
    (clear orange_block)
    (clear blue_block)
    (clear yellow_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on orange_block purple_block)
      (on purple_block green_block)
      (on green_block blue_block)
      (on blue_block red_block)
    )
  )
)