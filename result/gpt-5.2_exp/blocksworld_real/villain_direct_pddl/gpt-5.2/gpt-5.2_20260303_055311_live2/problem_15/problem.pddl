(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green yellow red blue purple orange - block
    robot1 - robot
  )
  (:init
    ;; initial stack observed (bottom to top): purple, blue, red, yellow, green
    (ontable purple)
    (on blue purple)
    (on red blue)
    (on yellow red)
    (on green yellow)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (bottom to top): red, green, orange, purple, blue, yellow
      (ontable red)
      (on green red)
      (on orange green)
      (on purple orange)
      (on blue purple)
      (on yellow blue)
      (clear yellow)
    )
  )
)