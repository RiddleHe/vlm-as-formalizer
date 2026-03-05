(define (problem stack-pink-red-yellow-green)
  (:domain blocksworld)
  (:objects
    green-block-leftmost - block
    yellow-block-second-from-left - block
    pink-block-third-from-left - block
    red-block-rightmost - block
    robot-arm-1 - robot
  )

  (:init
    (ontable green-block-leftmost)
    (ontable yellow-block-second-from-left)
    (ontable pink-block-third-from-left)
    (ontable red-block-rightmost)

    (clear green-block-leftmost)
    (clear yellow-block-second-from-left)
    (clear pink-block-third-from-left)
    (clear red-block-rightmost)

    (handempty robot-arm-1)
  )

  (:goal
    (and
      (on red-block-rightmost yellow-block-second-from-left)
      (on yellow-block-second-from-left green-block-leftmost)
      (on pink-block-third-from-left red-block-rightmost)
    )
  )
)