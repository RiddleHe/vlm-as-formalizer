(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange purple yellow green - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on red blue)
    (ontable blue)

    ;; other blocks on table
    (ontable orange)
    (ontable purple)
    (ontable yellow)
    (ontable green)

    ;; clear blocks
    (clear red)
    (clear orange)
    (clear purple)
    (clear yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on orange purple)
      (on purple yellow)
      (on yellow green)
      (on green red)
    )
  )
)