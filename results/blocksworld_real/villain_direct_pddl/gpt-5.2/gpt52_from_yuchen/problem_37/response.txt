(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; current stack (bottom to top) inferred from the image:
    ;; red (ontable), purple on red, orange on purple, blue on orange, yellow on blue, green on yellow
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
      ;; goal stack (bottom to top): red, orange, purple, yellow, blue, green
      (ontable red)
      (on orange red)
      (on purple orange)
      (on yellow purple)
      (on blue yellow)
      (on green blue)
    )
  )
)