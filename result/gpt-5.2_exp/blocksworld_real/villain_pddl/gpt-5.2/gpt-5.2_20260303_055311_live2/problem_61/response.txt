(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange blue red green purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; On-table blocks
    (ontable yellow)
    (ontable orange)
    (ontable red)
    (ontable green)

    ;; Stack already present in the scene: purple on blue
    (ontable blue)
    (on purple blue)

    ;; Clear conditions
    (clear yellow)
    (clear orange)
    (clear red)
    (clear green)
    (clear purple)
  )
  (:goal
    (and
      (on yellow orange)
      (on blue red)
      (on green purple)
    )
  )
)