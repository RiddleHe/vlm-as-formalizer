(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green yellow purple red orange blue - block
    robot1 - robot
  )
  (:init
    ;; current tower (bottom -> top): blue, orange, red, purple, yellow, green
    (ontable blue)
    (on orange blue)
    (on red orange)
    (on purple red)
    (on yellow purple)
    (on green yellow)

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