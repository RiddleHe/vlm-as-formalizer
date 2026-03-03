(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    blue yellow orange green red purple - block
    robot1 - robot
  )
  (:init
    ;; initial stack (bottom -> top): purple, red, green, orange, yellow, blue
    (ontable purple)
    (on red purple)
    (on green red)
    (on orange green)
    (on yellow orange)
    (on blue yellow)

    (clear blue)
    (handempty robot1)
  )
  (:goal
    (and
      (on red blue)
      (on orange yellow)
      (on purple green)
    )
  )
)