(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; From visual inspection:
    ;; - red has yellow on top
    ;; - blue has purple on top
    ;; - green and orange are on the table
    (on yellow red)
    (on purple blue)

    (ontable red)
    (ontable blue)
    (ontable green)
    (ontable orange)

    (clear yellow)
    (clear purple)
    (clear green)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
      (on orange green)
      (ontable green)
    )
  )
)