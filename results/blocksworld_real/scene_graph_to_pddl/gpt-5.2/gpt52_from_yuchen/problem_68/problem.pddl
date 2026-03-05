(define (problem blocksworld-stacking-1)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block green_block orange_block blue_block red_block - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable orange_block)

    (on blue_block orange_block)
    (on red_block blue_block)

    (clear purple_block)
    (clear yellow_block)
    (clear green_block)
    (clear red_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block red_block)
      (on red_block green_block)
      (on green_block blue_block)
      (on blue_block purple_block)
      (on purple_block yellow_block)
    )
  )
)