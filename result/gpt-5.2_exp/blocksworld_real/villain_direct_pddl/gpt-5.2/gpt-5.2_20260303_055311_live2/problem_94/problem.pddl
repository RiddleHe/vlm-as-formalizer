(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks observed in the scene
    (on yellow red)
    (on purple blue)

    ;; table placements
    (ontable green)
    (ontable orange)
    (ontable red)
    (ontable blue)

    ;; clear blocks
    (clear green)
    (clear orange)
    (clear yellow)
    (clear purple)
  )
  (:goal
    (and
      (on orange green)
      (on yellow orange)
      (on blue yellow)
      (on red blue)
      (on purple red)
      (ontable green)
    )
  )
)