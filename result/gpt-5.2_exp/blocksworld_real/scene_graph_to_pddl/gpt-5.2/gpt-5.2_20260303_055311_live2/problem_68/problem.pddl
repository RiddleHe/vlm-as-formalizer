(define (problem blocksworld-stacks-1)
  (:domain blocksworld)
  (:objects
    purple-block yellow-block green-block orange-block-bottom blue-block-middle red-block-top - block
    robot-arm - robot
  )
  (:init
    ;; blocks on table
    (ontable purple-block)
    (ontable yellow-block)
    (ontable green-block)
    (ontable orange-block-bottom)

    ;; current stack relations
    (on blue-block-middle orange-block-bottom)
    (on red-block-top blue-block-middle)

    ;; clear blocks
    (clear purple-block)
    (clear yellow-block)
    (clear green-block)
    (clear red-block-top)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (on orange-block-bottom red-block-top)
      (on red-block-top green-block)
      (on green-block blue-block-middle)
      (on blue-block-middle purple-block)
      (on purple-block yellow-block)
    )
  )
)