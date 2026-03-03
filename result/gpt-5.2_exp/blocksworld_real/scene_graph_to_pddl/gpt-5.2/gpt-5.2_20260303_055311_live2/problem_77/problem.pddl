(define (problem blocksworld-stack1)
  (:domain blocksworld)
  (:objects
    blue-cube-block purple-cube-block orange-cube-block yellow-cube-block red-cube-block green-cube-block - block
    robot-arm - robot
  )
  (:init
    (ontable blue-cube-block)
    (ontable purple-cube-block)

    (on orange-cube-block purple-cube-block)
    (on yellow-cube-block orange-cube-block)
    (on red-cube-block yellow-cube-block)
    (on green-cube-block red-cube-block)

    (clear blue-cube-block)
    (clear green-cube-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on blue-cube-block purple-cube-block)
      (on purple-cube-block green-cube-block)
      (on green-cube-block red-cube-block)
      (on red-cube-block yellow-cube-block)
      (on yellow-cube-block orange-cube-block)
    )
  )
)