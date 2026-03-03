(define (problem blocksworld-stacking-1)
  (:domain blocksworld)
  (:objects
    orange-block-bottom-of-stack
    blue-block-middle-of-stack
    green-block-top-of-stack
    yellow-block-single
    red-block-single
    purple-block-front
    robot-arm - robot
  )

  (:init
    ;; robot state
    (handempty robot-arm)

    ;; blocks on table
    (ontable orange-block-bottom-of-stack)
    (ontable yellow-block-single)
    (ontable red-block-single)
    (ontable purple-block-front)

    ;; existing stack relations
    (on blue-block-middle-of-stack orange-block-bottom-of-stack)
    (on green-block-top-of-stack blue-block-middle-of-stack)

    ;; clear blocks
    (clear green-block-top-of-stack)
    (clear yellow-block-single)
    (clear red-block-single)
    (clear purple-block-front)
  )

  (:goal
    (and
      (on orange-block-bottom-of-stack yellow-block-single)
      (on yellow-block-single green-block-top-of-stack)
      (on green-block-top-of-stack purple-block-front)
      (on purple-block-front red-block-single)
      (on red-block-single blue-block-middle-of-stack)
    )
  )
)