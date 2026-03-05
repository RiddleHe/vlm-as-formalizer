(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    purple-top-stack-block
    yellow-stack-block
    blue-stack-block
    orange-bottom-stack-block
    green-topmost-block
    red-single-block
    robot-arm - robot
  )
  (:init
    (ontable orange-bottom-stack-block)
    (ontable red-single-block)

    (on blue-stack-block orange-bottom-stack-block)
    (on yellow-stack-block blue-stack-block)
    (on purple-top-stack-block yellow-stack-block)
    (on green-topmost-block purple-top-stack-block)

    (clear green-topmost-block)
    (clear red-single-block)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on red-single-block green-topmost-block)
      (on orange-bottom-stack-block blue-stack-block)
      (on blue-stack-block purple-top-stack-block)
      (on purple-top-stack-block yellow-stack-block)
    )
  )
)