(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue red green purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; stack A
    (ontable yellow)
    (on purple yellow)
    (clear purple)

    ;; stack B
    (ontable green)
    (on red green)
    (on blue red)
    (clear blue)

    ;; single block
    (ontable orange)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: green over blue over purple over orange
      (on green blue)
      (on blue purple)
      (on purple orange)

      ;; Stack 2: red over yellow
      (on red yellow)
    )
  )
)