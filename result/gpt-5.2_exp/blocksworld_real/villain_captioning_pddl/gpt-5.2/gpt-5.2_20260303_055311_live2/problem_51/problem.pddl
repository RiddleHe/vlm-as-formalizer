(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack
    (on blue orange)

    ;; table placements
    (ontable orange)
    (ontable green)
    (ontable red)
    (ontable yellow)
    (ontable purple)

    ;; clear conditions
    (clear blue)
    (clear green)
    (clear red)
    (clear yellow)
    (clear purple)
    ;; orange is not clear because blue is on it
  )
  (:goal
    (and
      ;; stack 1: orange over purple over red over yellow
      (on orange purple)
      (on purple red)
      (on red yellow)

      ;; stack 2: green over blue
      (on green blue)
    )
  )
)