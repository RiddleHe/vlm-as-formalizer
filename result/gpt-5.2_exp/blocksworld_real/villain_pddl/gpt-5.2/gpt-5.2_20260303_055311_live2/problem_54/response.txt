(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; All blocks are on the table except yellow, which is on green (as seen).
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (ontable purple)

    (on yellow green)

    ;; Clear status
    (clear red)
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)

    ;; Robot state
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