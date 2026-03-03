(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange purple green blue red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack in the scene
    (on orange purple)
    (clear orange)
    (ontable purple)

    ;; other blocks on the table
    (ontable yellow)
    (clear yellow)

    (ontable green)
    (clear green)

    (ontable blue)
    (clear blue)

    (ontable red)
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