(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    green-cube-block yellow-cube-block red-cube-block
    purple-cube-block orange-cube-block blue-cube-block - block
    single-robot-arm - robot
  )
  (:init
    (ontable green-cube-block)
    (ontable yellow-cube-block)
    (ontable red-cube-block)
    (ontable purple-cube-block)
    (ontable orange-cube-block)
    (ontable blue-cube-block)

    (clear green-cube-block)
    (clear yellow-cube-block)
    (clear red-cube-block)
    (clear purple-cube-block)
    (clear orange-cube-block)
    (clear blue-cube-block)

    (handempty single-robot-arm)
  )
  (:goal
    (and
      (on green-cube-block red-cube-block)
      (on blue-cube-block yellow-cube-block)
      (on purple-cube-block orange-cube-block)
    )
  )
)