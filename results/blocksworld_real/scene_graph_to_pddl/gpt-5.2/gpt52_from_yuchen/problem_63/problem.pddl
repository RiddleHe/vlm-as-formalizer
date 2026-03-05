(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    orange_block yellow_block blue_block red_block purple_block green_block - block
    single_robot_arm - robot
  )
  (:init
    (ontable orange_block)
    (ontable yellow_block)
    (ontable blue_block)
    (ontable red_block)
    (ontable purple_block)
    (ontable green_block)

    (clear orange_block)
    (clear yellow_block)
    (clear blue_block)
    (clear red_block)
    (clear purple_block)
    (clear green_block)

    (handempty single_robot_arm)
  )
  (:goal
    (and
      (on orange_block yellow_block)
      (on blue_block red_block)
      (on purple_block green_block)
    )
  )
)