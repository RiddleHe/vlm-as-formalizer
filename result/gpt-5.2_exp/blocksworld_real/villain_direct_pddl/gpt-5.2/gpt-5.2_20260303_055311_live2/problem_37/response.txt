(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; initial stack observed (bottom -> top): red, purple, orange, blue, yellow, green
    (ontable red)
    (on purple red)
    (on orange purple)
    (on blue orange)
    (on yellow blue)
    (on green yellow)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (bottom -> top): red, orange, purple, yellow, blue, green
      (ontable red)
      (on orange red)
      (on purple orange)
      (on yellow purple)
      (on blue yellow)
      (on green blue)
      (clear green)
    )
  )
)