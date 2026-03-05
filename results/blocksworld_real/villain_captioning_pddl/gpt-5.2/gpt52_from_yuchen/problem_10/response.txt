(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue-block green-block red-block yellow-block purple-block orange-block - block
  )
  (:init
    (handempty robot1)

    (ontable blue-block)
    (ontable green-block)
    (ontable red-block)
    (ontable yellow-block)
    (ontable purple-block)
    (ontable orange-block)

    (clear blue-block)
    (clear green-block)
    (clear red-block)
    (clear yellow-block)
    (clear purple-block)
    (clear orange-block)
  )
  (:goal
    (and
      (on blue-block green-block)
      (on red-block yellow-block)
      (on purple-block orange-block)
    )
  )
)