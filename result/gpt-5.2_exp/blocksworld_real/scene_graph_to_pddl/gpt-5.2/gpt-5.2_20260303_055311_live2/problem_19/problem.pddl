(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    red-cube-block yellow-cube-block green-cube-block blue-cube-block purple-cube-block - block
    robot-arm - robot
  )
  (:init
    (ontable red-cube-block)
    (ontable yellow-cube-block)
    (ontable green-cube-block)
    (ontable purple-cube-block)

    (on blue-cube-block green-cube-block)

    (clear red-cube-block)
    (clear yellow-cube-block)
    (clear blue-cube-block)
    (clear purple-cube-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on blue-cube-block red-cube-block)
      (on yellow-cube-block green-cube-block)
      (on green-cube-block red-cube-block)
      (on red-cube-block purple-cube-block)
    )
  )
)