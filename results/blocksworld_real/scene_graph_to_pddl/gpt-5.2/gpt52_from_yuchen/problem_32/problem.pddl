(define (problem blocksworld-stacking-1)
  (:domain blocksworld)
  (:objects
    purple-top-left - block
    blue-middle-left - block
    yellow-bottom-left - block
    orange-top-right - block
    red-middle-right - block
    green-bottom-right - block
    robot-arm - robot
  )
  (:init
    ;; left stack
    (ontable yellow-bottom-left)
    (on blue-middle-left yellow-bottom-left)
    (on purple-top-left blue-middle-left)

    ;; right stack
    (ontable green-bottom-right)
    (on red-middle-right green-bottom-right)
    (on orange-top-right red-middle-right)

    ;; clear blocks
    (clear purple-top-left)
    (clear orange-top-right)

    ;; robot state
    (handempty robot-arm)
  )
  (:goal
    (and
      (ontable orange-top-right)
      (on green-bottom-right orange-top-right)
      (on red-middle-right green-bottom-right)
      (on purple-top-left red-middle-right)
      (on blue-middle-left purple-top-left)
      (on yellow-bottom-left blue-middle-left)
    )
  )
)