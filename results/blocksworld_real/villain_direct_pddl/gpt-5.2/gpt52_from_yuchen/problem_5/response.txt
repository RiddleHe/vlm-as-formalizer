(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions observed in the scene
    (on red yellow)
    (ontable yellow)

    (ontable orange)
    (ontable purple)
    (ontable blue)
    (ontable green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear purple)
    (clear blue)
    (clear green)
  )
  (:goal
    (and
      (on yellow purple)
      (on blue red)
      (on orange green)
    )
  )
)