(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple yellow orange blue red - block
    robot1 - robot
  )
  (:init
    ;; All blocks are on the table except the visible stack (blue on red)
    (ontable green)
    (ontable purple)
    (ontable yellow)
    (ontable orange)
    (ontable red)

    (on blue red)

    ;; Clear conditions
    (clear green)
    (clear purple)
    (clear yellow)
    (clear orange)
    (clear blue)

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