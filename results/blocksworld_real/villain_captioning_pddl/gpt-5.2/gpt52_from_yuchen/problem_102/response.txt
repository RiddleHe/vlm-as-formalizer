(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red blue yellow purple orange - block
    robot1 - robot
  )
  (:init
    ;; tower (bottom -> top): orange, purple, yellow, blue, red, green
    (ontable orange)
    (on purple orange)
    (on yellow purple)
    (on blue yellow)
    (on red blue)
    (on green red)

    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; required stack: green over red over orange over blue over purple over yellow
      (on green red)
      (on red orange)
      (on orange blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)