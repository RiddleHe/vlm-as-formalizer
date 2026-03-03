(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue_block green_block red_block yellow_block orange_block purple_block - block
  )
  (:init
    (handempty robot1)

    (ontable blue_block)
    (ontable green_block)
    (ontable red_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable purple_block)

    (clear blue_block)
    (clear green_block)
    (clear red_block)
    (clear yellow_block)
    (clear orange_block)
    (clear purple_block)
  )
  (:goal
    (and
      (on blue_block green_block)
      (on red_block yellow_block)
      (on purple_block orange_block)
    )
  )
)