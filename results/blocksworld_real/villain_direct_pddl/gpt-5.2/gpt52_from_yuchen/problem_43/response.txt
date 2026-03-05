(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; block relations from the scene
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable orange)
    (ontable red)

    (on orange purple)

    ;; clear blocks
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)
  )
  (:goal
    (and
      ;; Stack 1: green over orange over blue over yellow
      (on green orange)
      (on orange blue)
      (on blue yellow)

      ;; Stack 2: purple over red
      (on purple red)
    )
  )
)