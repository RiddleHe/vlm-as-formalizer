(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple red green - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Stacks and table placements observed
    (on orange blue)
    (ontable blue)
    (clear orange)

    (on yellow purple)
    (ontable purple)
    (clear yellow)

    (ontable red)
    (clear red)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      (on orange blue)
      (on blue yellow)
      (on yellow purple)
      (on purple red)
      (on red green)
      (ontable green)
      (clear orange)
    )
  )
)