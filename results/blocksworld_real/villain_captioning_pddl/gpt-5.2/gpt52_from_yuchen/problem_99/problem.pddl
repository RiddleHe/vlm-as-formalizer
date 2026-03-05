(define (problem blocksworld_stacks_3)
  (:domain blocksworld)

  (:objects
    green_block yellow_block purple_block orange_block blue_block red_block - block
    robot1 - robot
  )

  (:init
    (ontable green_block)
    (ontable yellow_block)
    (ontable purple_block)
    (ontable orange_block)
    (ontable blue_block)
    (ontable red_block)

    (clear green_block)
    (clear yellow_block)
    (clear purple_block)
    (clear orange_block)
    (clear blue_block)
    (clear red_block)

    (handempty robot1)
  )

  (:goal
    (and
      (on green_block red_block)
      (on blue_block yellow_block)
      (on purple_block orange_block)
    )
  )
)