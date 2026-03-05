(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue red green orange purple yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack: blue on red on green (green on table)
    (on blue red)
    (on red green)
    (ontable green)
    (clear blue)

    ;; stack: purple on yellow (yellow on table)
    (on purple yellow)
    (ontable yellow)
    (clear purple)

    ;; single block on table
    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      ;; stack 1: green over blue over purple over orange
      (on green blue)
      (on blue purple)
      (on purple orange)

      ;; stack 2: red over yellow
      (on red yellow)
    )
  )
)