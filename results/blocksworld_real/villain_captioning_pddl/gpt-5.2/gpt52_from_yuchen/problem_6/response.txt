(define (problem blocksworld_scene_stack1)
  (:domain blocksworld)
  (:objects
    blue purple yellow green orange red - block
    robot1 - robot
  )
  (:init
    ;; current stack
    (on blue purple)
    (ontable purple)

    ;; other blocks on table
    (ontable yellow)
    (ontable green)
    (ontable orange)
    (ontable red)

    ;; clear conditions
    (clear blue)
    (clear yellow)
    (clear green)
    (clear orange)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on orange red)
      (on red purple)
      (on purple green)
      (on green yellow)
    )
  )
)