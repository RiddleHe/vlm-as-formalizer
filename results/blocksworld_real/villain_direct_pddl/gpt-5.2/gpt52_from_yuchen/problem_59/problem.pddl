(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange purple red blue green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks/placements observed
    (on purple orange)
    (on blue green)

    ;; table blocks
    (ontable yellow)
    (ontable red)
    (ontable orange)
    (ontable green)

    ;; clear blocks
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear red)
  )
  (:goal
    (and
      (on yellow blue)
      (on orange purple)
      (on red green)
    )
  )
)