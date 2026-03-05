(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    green red orange purple blue yellow - block
    robot1 - robot
  )
  (:init
    ;; Left small stack
    (on green red)
    (ontable red)
    (clear green)

    ;; Right tall stack (bottom -> top): yellow, purple, orange, blue
    (ontable yellow)
    (on purple yellow)
    (on orange purple)
    (on blue orange)
    (clear blue)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on orange purple)
      (on blue yellow)
    )
  )
)