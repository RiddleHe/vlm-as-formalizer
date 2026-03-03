(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange blue purple yellow - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single stack (top to bottom)
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