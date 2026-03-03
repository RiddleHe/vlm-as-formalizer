(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple red blue yellow orange - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: blue is on red; all other blocks are on the table.
    (on blue red)

    (ontable red)
    (ontable green)
    (ontable purple)
    (ontable yellow)
    (ontable orange)

    ;; Clear blocks (nothing on top of them)
    (clear blue)
    (clear green)
    (clear purple)
    (clear yellow)
    (clear orange)

    ;; red is not clear because blue is on it

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
    )
  )
)