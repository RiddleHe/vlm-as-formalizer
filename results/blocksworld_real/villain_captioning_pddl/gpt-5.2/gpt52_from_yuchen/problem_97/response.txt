(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    blue-block orange-block green-block red-block yellow-block purple-block - block
    robot1 - robot
  )
  (:init
    (ontable blue-block)
    (ontable orange-block)
    (ontable green-block)
    (ontable red-block)
    (ontable yellow-block)
    (ontable purple-block)

    (clear blue-block)
    (clear orange-block)
    (clear green-block)
    (clear red-block)
    (clear yellow-block)
    (clear purple-block)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue-block orange-block)
      (on green-block red-block)
      (on yellow-block purple-block)
    )
  )
)