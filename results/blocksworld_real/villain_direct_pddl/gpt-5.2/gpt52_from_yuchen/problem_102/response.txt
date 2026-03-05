(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange blue purple yellow - block
    robot1 - robot
  )
  (:init
    ;; initial tower observed (top to bottom):
    ;; green on red on blue on yellow on purple on orange (orange on table)
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