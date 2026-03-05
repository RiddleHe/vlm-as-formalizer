(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange purple red yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; blocks on table
    (ontable purple)
    (ontable yellow)
    (ontable green)
    (ontable red)
    (ontable orange)

    ;; stack present in the scene: blue on orange
    (on blue orange)

    ;; clear conditions
    (clear purple)
    (clear yellow)
    (clear green)
    (clear red)
    (clear blue)

    ;; robot state
    (handempty robot1)
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