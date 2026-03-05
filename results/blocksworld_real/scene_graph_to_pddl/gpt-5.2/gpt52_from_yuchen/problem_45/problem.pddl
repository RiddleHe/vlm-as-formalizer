(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    purple-block green-block yellow-block blue-block red-block orange-block - block
    robot-arm - robot
  )
  (:init
    (ontable purple-block)
    (ontable green-block)
    (ontable yellow-block)
    (ontable blue-block)
    (ontable red-block)
    (ontable orange-block)

    (clear purple-block)
    (clear green-block)
    (clear yellow-block)
    (clear blue-block)
    (clear red-block)
    (clear orange-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on purple-block green-block)
      (on red-block yellow-block)
      (on orange-block blue-block)
    )
  )
)