(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    red-block-left - block
    orange-block-front-left - block
    green-block-front-center - block
    blue-block-back-center - block
    yellow-block-back-right - block
    purple-block-front-right - block
    robot-arm-1 - robot
  )
  (:init
    (ontable red-block-left)
    (ontable orange-block-front-left)
    (ontable green-block-front-center)
    (ontable blue-block-back-center)
    (ontable yellow-block-back-right)
    (ontable purple-block-front-right)

    (clear red-block-left)
    (clear orange-block-front-left)
    (clear green-block-front-center)
    (clear blue-block-back-center)
    (clear yellow-block-back-right)
    (clear purple-block-front-right)

    (handempty robot-arm-1)
  )
  (:goal
    (and
      (on green-block-front-center orange-block-front-left)
      (on orange-block-front-left red-block-left)
      (on blue-block-back-center purple-block-front-right)
      (on purple-block-front-right yellow-block-back-right)
    )
  )
)