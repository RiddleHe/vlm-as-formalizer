(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block blue_block yellow_block purple_block red_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block)
    (ontable red_block)
    (ontable green_block)
    (ontable purple_block)

    (clear orange_block)
    (clear red_block)
    (clear green_block)
    (clear yellow_block)

    (holding orange_block)
    (handfull robot_arm)

    (on orange_block blue_block)
    (on yellow_block purple_block)
  )
  (:goal
    (and
      (on orange_block blue_block)
      (on blue_block yellow_block)
      (on purple_block red_block)
      (on red_block green_block)
    )
  )
)