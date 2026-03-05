(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange purple red blue yellow - block
    robot1 - robot
  )
  (:init
    ;; current stack observed (top to bottom): green, orange, purple, red, blue, yellow
    (on green orange)
    (on orange purple)
    (on purple red)
    (on red blue)
    (on blue yellow)
    (ontable yellow)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      (on red orange)
      (on orange yellow)
      (on yellow blue)
      (on blue green)
      (on green purple)
      (ontable purple)
    )
  )
)