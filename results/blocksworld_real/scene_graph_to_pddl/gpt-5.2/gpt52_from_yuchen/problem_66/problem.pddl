(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    blue-block yellow-block red-block green-block orange-block purple-block - block
    robot-arm - robot
  )
  (:init
    (ontable blue-block)
    (ontable orange-block)

    (on yellow-block blue-block)
    (on red-block yellow-block)
    (on green-block red-block)
    (on purple-block orange-block)

    (clear green-block)
    (clear purple-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on orange-block green-block)
      (on red-block blue-block)
      (on blue-block purple-block)
      (on purple-block yellow-block)
    )
  )
)