(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    red-block orange-block blue-block yellow-block green-block purple-block - block
    robot-arm - robot
  )
  (:init
    (ontable red-block)
    (ontable orange-block)
    (ontable blue-block)
    (ontable green-block)
    (ontable purple-block)

    (on yellow-block green-block)

    (clear red-block)
    (clear orange-block)
    (clear blue-block)
    (clear yellow-block)
    (clear purple-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on yellow-block orange-block)
      (on orange-block purple-block)
      (on purple-block green-block)
      (on green-block blue-block)
      (on blue-block red-block)
    )
  )
)