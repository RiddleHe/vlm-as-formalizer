(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; on-table blocks
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable red)

    ;; existing stack
    (on orange purple)

    ;; clear conditions
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)
  )
  (:goal
    (and
      (on green orange)
      (on orange blue)
      (on blue yellow)
      (on purple red)
    )
  )
)