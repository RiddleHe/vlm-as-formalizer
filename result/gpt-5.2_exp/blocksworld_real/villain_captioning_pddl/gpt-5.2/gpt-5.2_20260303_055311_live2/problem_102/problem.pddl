(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange blue purple yellow - block
    robot1 - robot
  )
  (:init
    ;; current stack (bottom -> top): orange, purple, yellow, blue, red, green
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
      ;; goal stack: green over red over orange over blue over purple over yellow
      (ontable yellow)
      (on purple yellow)
      (on blue purple)
      (on orange blue)
      (on red orange)
      (on green red)
    )
  )
)