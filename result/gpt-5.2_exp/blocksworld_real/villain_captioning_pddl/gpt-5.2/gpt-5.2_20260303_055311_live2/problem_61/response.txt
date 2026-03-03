(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack
    (ontable blue)
    (on purple blue)
    (clear purple)

    ;; single blocks on table
    (ontable green)
    (clear green)

    (ontable orange)
    (clear orange)

    (ontable yellow)
    (clear yellow)

    (ontable red)
    (clear red)
  )
  (:goal
    (and
      (on yellow orange)
      (on blue red)
      (on green purple)
    )
  )
)