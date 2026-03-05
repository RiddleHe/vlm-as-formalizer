(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue yellow orange green red purple - block
    robot1 - robot
  )
  (:init
    ;; Stack A
    (on orange green)
    (ontable green)
    (clear orange)

    ;; Stack B
    (on blue purple)
    (ontable purple)
    (clear blue)

    ;; Stack C
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: blue over yellow over orange
      (on blue yellow)
      (on yellow orange)

      ;; Stack 2: green over red over purple
      (on green red)
      (on red purple)
    )
  )
)