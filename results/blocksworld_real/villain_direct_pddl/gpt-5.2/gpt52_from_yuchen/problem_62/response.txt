(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue yellow orange green red purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; left stack: orange on green (green on table)
    (on orange green)
    (ontable green)
    (clear orange)

    ;; middle stack: blue on purple (purple on table)
    (on blue purple)
    (ontable purple)
    (clear blue)

    ;; right stack: red on yellow (yellow on table)
    (on red yellow)
    (ontable yellow)
    (clear red)
  )
  (:goal
    (and
      ;; Stack 1: blue over yellow over orange
      (on blue yellow)
      (on yellow orange)
      (ontable orange)

      ;; Stack 2: green over red over purple
      (on green red)
      (on red purple)
      (ontable purple)
    )
  )
)