(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    green yellow purple red orange blue - block
    robot1 - robot
  )
  (:init
    ;; stack from top to bottom: green, yellow, purple, red, orange, blue
    (on green yellow)
    (on yellow purple)
    (on purple red)
    (on red orange)
    (on orange blue)
    (ontable blue)

    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on purple green)
      (on orange red)
      (on blue yellow)
    )
  )
)