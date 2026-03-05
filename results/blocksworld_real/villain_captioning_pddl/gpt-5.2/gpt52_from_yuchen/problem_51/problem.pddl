(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange purple red yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stacked pair in the scene
    (on blue orange)
    (ontable orange)

    ;; other blocks on the table
    (ontable purple)
    (ontable red)
    (ontable yellow)
    (ontable green)

    ;; clear blocks
    (clear blue)
    (clear purple)
    (clear red)
    (clear yellow)
    (clear green)
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