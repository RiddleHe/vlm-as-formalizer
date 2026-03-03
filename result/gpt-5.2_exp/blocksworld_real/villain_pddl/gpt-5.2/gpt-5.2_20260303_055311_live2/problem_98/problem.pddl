(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow purple green red blue orange - block
    robot1 - robot
  )
  (:init
    ;; initial tower (bottom -> top): orange, blue, red, green, purple, yellow
    (ontable orange)
    (on blue orange)
    (on red blue)
    (on green red)
    (on purple green)
    (on yellow purple)

    (clear yellow)
    (handempty robot1)
  )
  (:goal
    (and
      ;; create 3 stacks as requested
      (on orange red)
      (on yellow blue)
      (on purple green)
    )
  )
)