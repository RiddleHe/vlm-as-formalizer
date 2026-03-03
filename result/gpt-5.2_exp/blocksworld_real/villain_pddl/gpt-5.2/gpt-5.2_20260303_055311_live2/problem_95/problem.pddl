(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red blue orange purple yellow - block
    robot1 - robot
  )
  (:init
    ;; left stack in the scene: blue on orange on green (green on table)
    (on blue orange)
    (on orange green)
    (ontable green)
    (clear blue)

    ;; right stack in the scene: red on purple (purple on table)
    (on red purple)
    (ontable purple)
    (clear red)

    ;; yellow is alone on the table
    (ontable yellow)
    (clear yellow)

    ;; robot hand is empty
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over red
      (on green red)

      ;; stack 2: blue over orange over purple over yellow
      (on blue orange)
      (on orange purple)
      (on purple yellow)
    )
  )
)