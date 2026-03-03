(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1 in the scene: purple on yellow on green on blue (blue on table)
    (ontable blue)
    (on green blue)
    (on yellow green)
    (on purple yellow)
    (clear purple)

    ;; Stack 2 in the scene: orange on red (red on table)
    (ontable red)
    (on orange red)
    (clear orange)
  )
  (:goal
    (and
      ;; Create 3 stacks as requested
      (on green red)
      (on purple blue)
      (on yellow orange)
    )
  )
)