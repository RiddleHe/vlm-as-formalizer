(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; blocks on table
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (ontable purple)

    ;; current stack
    (on yellow green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue red)
    )
  )
)