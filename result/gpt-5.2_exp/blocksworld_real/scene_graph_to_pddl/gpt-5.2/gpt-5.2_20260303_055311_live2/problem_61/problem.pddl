(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    green_block orange_block yellow_block red_block blue_block purple_block - block
    single_robot - robot
  )
  (:init
    (ontable green_block)
    (ontable orange_block)
    (ontable yellow_block)
    (ontable red_block)
    (ontable blue_block)
    (ontable purple_block)

    (clear green_block)
    (clear orange_block)
    (clear yellow_block)
    (clear red_block)
    (clear purple_block)

    (on purple_block blue_block)

    (handempty single_robot)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on blue_block red_block)
      (on green_block purple_block)
    )
  )
)