(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange yellow purple green - block
    robot1 - robot
  )
  (:init
    ;; From visual inspection: a single vertical stack (top to bottom):
    ;; blue on yellow on orange on green on red on purple, with purple on table.
    (on blue yellow)
    (on yellow orange)
    (on orange green)
    (on green red)
    (on red purple)
    (ontable purple)

    (clear blue)
    (handempty robot1)
  )
  (:goal
    (and
      (on red blue)
      (on orange yellow)
      (on purple green)
    )
  )
)