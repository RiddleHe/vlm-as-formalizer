(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on yellow blue)

    ;; on-table blocks
    (ontable blue)
    (ontable green)
    (ontable red)
    (ontable orange)
    (ontable purple)

    ;; clear blocks (nothing on top)
    (clear yellow)
    (clear green)
    (clear red)
    (clear orange)
    (clear purple)
    ;; blue is not clear because yellow is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)