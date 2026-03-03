(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange purple yellow green red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except the visible stack (red on blue)
    (ontable orange)
    (ontable yellow)
    (ontable green)
    (ontable purple)
    (ontable blue)

    (on red blue)

    ;; clear conditions
    (clear orange)
    (clear yellow)
    (clear green)
    (clear purple)
    (clear red)

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