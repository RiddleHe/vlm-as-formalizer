(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    orange-block-bottom-left
    purple-block-middle-left
    red-block-top-left
    green-block-bottom-right
    yellow-block-middle-right
    blue-block-top-right
    - block
    robot-arm-1 - robot
  )
  (:init
    (ontable orange-block-bottom-left)
    (ontable green-block-bottom-right)

    (on purple-block-middle-left orange-block-bottom-left)
    (on red-block-top-left purple-block-middle-left)
    (on yellow-block-middle-right green-block-bottom-right)
    (on blue-block-top-right yellow-block-middle-right)

    (clear red-block-top-left)
    (clear blue-block-top-right)

    (handempty robot-arm-1)
  )
  (:goal
    (and
      (on orange-block-bottom-left blue-block-top-right)
      (on red-block-top-left green-block-bottom-right)
      (on yellow-block-middle-right purple-block-middle-left)
    )
  )
)