(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    red-block orange-block green-block blue-block yellow-block purple-block - block
    robot1 - robot
  )
  (:init
    (ontable red-block)
    (ontable orange-block)
    (ontable green-block)
    (ontable blue-block)
    (ontable yellow-block)
    (ontable purple-block)

    (clear red-block)
    (clear orange-block)
    (clear green-block)
    (clear blue-block)
    (clear yellow-block)
    (clear purple-block)

    (handempty robot1)
  )
  (:goal
    (and
      (on green-block orange-block)
      (on orange-block red-block)
      (on blue-block purple-block)
      (on purple-block yellow-block)
    )
  )
)