(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable yellow)
    (ontable purple)

    ;; existing stack
    (on orange blue)

    ;; clear conditions
    (clear green)
    (clear orange)
    (clear red)
    (clear yellow)
    (clear purple)
    ;; blue is not clear because orange is on it
  )
  (:goal
    (and
      (on purple yellow)
      (on yellow orange)
      (on orange red)
      (on red blue)
      (on blue green)
    )
  )
)