(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block blue_block yellow_block purple_block red_block green_block - block
    robot_arm - robot
  )
  (:init
    (on orange_block blue_block)
    (on yellow_block purple_block)

    (ontable blue_block)
    (ontable purple_block)
    (ontable red_block)
    (ontable green_block)

    (clear orange_block)
    (clear yellow_block)
    (clear red_block)
    (clear green_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block blue_block)
      (on blue_block yellow_block)
      (ontable yellow_block)

      (on purple_block red_block)
      (on red_block green_block)
      (ontable green_block)
    )
  )
)