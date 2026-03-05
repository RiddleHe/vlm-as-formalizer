(define (problem blocksworld_stack_rainbow)
  (:domain blocksworld)
  (:objects
    yellow pink green red purple orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack on the left: yellow on pink on green (green on table)
    (on yellow pink)
    (on pink green)
    (ontable green)
    (clear yellow)

    ;; middle stack: red on purple (purple on table)
    (on red purple)
    (ontable purple)
    (clear red)

    ;; right single block on table (used as the "blue" block since no blue is visible)
    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      (on yellow pink)
      (on pink green)
      (on green red)
      (on red purple)
      (on purple orange)
    )
  )
)