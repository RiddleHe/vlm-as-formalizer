(define (problem blocksworld_color_stacks)
  (:domain blocksworld)
  (:objects
    blue yellow orange green red purple - block
    robot1 - robot
  )
  (:init
    ;; left stack: orange on green
    (on orange green)
    (ontable green)
    (clear orange)

    ;; middle stack: blue on purple
    (on blue purple)
    (ontable purple)
    (clear blue)

    ;; right stack: red on yellow
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: blue over yellow over orange
      (on blue yellow)
      (on yellow orange)

      ;; stack 2: green over red over purple
      (on green red)
      (on red purple)
    )
  )
)