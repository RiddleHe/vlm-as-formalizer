(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green blue orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack
    (on orange purple)
    (clear orange)

    ;; blocks on the table
    (ontable purple)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable red)

    ;; clear blocks on table
    (clear yellow)
    (clear green)
    (clear blue)
    (clear red)
  )
  (:goal
    (and
      (on green yellow)
      (on blue orange)
      (on purple red)
    )
  )
)