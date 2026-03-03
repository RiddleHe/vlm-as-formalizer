(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    yellow-block red-block green-block blue-block orange-block purple-block - block
    robot-arm - robot
  )
  (:init
    (ontable yellow-block)
    (ontable red-block)
    (ontable green-block)
    (ontable blue-block)

    (on orange-block blue-block)
    (on purple-block orange-block)

    (clear yellow-block)
    (clear red-block)
    (clear green-block)
    (clear purple-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on green-block blue-block)
      (on blue-block purple-block)
      (on yellow-block orange-block)
      (on orange-block red-block)
    )
  )
)