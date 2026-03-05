(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    blue-cube-block purple-cube-block green-cube-block yellow-cube-block orange-cube-block red-cube-block - block
    assumed-robot-arm - robot
  )
  (:init
    (ontable blue-cube-block)
    (ontable purple-cube-block)
    (ontable green-cube-block)
    (ontable yellow-cube-block)
    (ontable orange-cube-block)
    (ontable red-cube-block)

    (clear blue-cube-block)
    (clear purple-cube-block)
    (clear green-cube-block)
    (clear yellow-cube-block)
    (clear orange-cube-block)
    (clear red-cube-block)

    (handempty assumed-robot-arm)
  )
  (:goal
    (and
      (on blue-cube-block purple-cube-block)
      (on green-cube-block yellow-cube-block)
      (on red-cube-block orange-cube-block)
    )
  )
)