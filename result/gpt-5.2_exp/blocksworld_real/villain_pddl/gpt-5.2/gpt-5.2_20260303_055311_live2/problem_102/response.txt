(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange blue purple yellow - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single vertical stack (top to bottom):
    ;; green, red, blue, yellow, purple, orange; with orange on the table.
    (on green red)
    (on red blue)
    (on blue yellow)
    (on yellow purple)
    (on purple orange)
    (ontable orange)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on red orange)
      (on orange blue)
      (on blue purple)
      (on purple yellow)
      (ontable yellow)
      (clear green)
    )
  )
)