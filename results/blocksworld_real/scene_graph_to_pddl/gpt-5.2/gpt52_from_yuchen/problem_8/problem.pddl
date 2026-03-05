(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    green-block purple-block blue-block orange-block red-block yellow-block - block
    robot-arm - robot
  )
  (:init
    (ontable green-block)
    (ontable purple-block)
    (ontable blue-block)
    (ontable orange-block)
    (ontable red-block)
    (ontable yellow-block)

    (clear green-block)
    (clear purple-block)
    (clear blue-block)
    (clear orange-block)
    (clear red-block)
    (clear yellow-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on yellow-block blue-block)
      (on blue-block purple-block)
      (on red-block orange-block)
      (on orange-block green-block)
    )
  )
)