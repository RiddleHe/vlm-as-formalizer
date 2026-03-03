(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red orange green blue yellow purple - block
    robot1 - robot
  )
  (:init
    ;; All blocks are on the table and clear (no stacks initially)
    (ontable red)
    (ontable orange)
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)

    (clear red)
    (clear orange)
    (clear green)
    (clear blue)
    (clear yellow)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: green over orange over red
      (on green orange)
      (on orange red)

      ;; Stack 2: blue over purple over yellow
      (on blue purple)
      (on purple yellow)
    )
  )
)