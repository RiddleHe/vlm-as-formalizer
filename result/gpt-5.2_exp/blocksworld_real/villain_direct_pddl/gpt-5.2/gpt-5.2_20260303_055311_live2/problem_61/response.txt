(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; table placements
    (ontable green)
    (ontable orange)
    (ontable yellow)
    (ontable red)
    (ontable blue)
    (ontable purple)

    ;; existing stack in the scene: purple on blue
    (on purple blue)

    ;; clear conditions
    (clear green)
    (clear orange)
    (clear yellow)
    (clear red)
    (clear purple)

    ;; blue is not clear because purple is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on blue red)
      (on green purple)
    )
  )
)