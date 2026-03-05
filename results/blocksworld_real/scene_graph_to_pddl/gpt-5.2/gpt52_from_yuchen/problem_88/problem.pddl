(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    orange_block blue_block green_block purple_block red_block yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable purple_block)
    (ontable yellow_block)

    (on orange_block blue_block)
    (on blue_block green_block)
    (on red_block yellow_block)

    (clear orange_block)
    (clear purple_block)
    (clear red_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block blue_block)
      (on yellow_block red_block)
      (on red_block purple_block)
      (on purple_block orange_block)
    )
  )
)