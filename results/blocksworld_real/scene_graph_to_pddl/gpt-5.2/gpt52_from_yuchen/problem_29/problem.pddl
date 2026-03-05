(define (problem blocksworld-stack1)
  (:domain blocksworld)
  (:objects
    blue-cube-block
    yellow-cube-block
    orange-cube-block
    green-cube-block
    red-cube-block
    purple-cube-block
    robot-arm - robot
  )
  (:init
    (ontable blue-cube-block)
    (ontable yellow-cube-block)
    (ontable purple-cube-block)
    (ontable red-cube-block)

    (on orange-cube-block green-cube-block)
    (on green-cube-block red-cube-block)

    (clear blue-cube-block)
    (clear yellow-cube-block)
    (clear orange-cube-block)
    (clear purple-cube-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on blue-cube-block orange-cube-block)
      (on orange-cube-block green-cube-block)
      (on green-cube-block purple-cube-block)
      (on purple-cube-block red-cube-block)
      (on red-cube-block yellow-cube-block)
    )
  )
)