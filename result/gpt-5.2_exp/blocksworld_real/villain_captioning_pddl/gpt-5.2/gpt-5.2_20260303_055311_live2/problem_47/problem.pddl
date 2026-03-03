(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple yellow orange blue red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stacked blocks on right
    (ontable red)
    (on blue red)
    (clear blue)

    ;; single blocks on table
    (ontable green)
    (clear green)

    (ontable purple)
    (clear purple)

    (ontable yellow)
    (clear yellow)

    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
      (ontable orange)
      (clear green)
    )
  )
)