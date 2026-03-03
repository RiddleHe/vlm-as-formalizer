(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks on table
    (ontable yellow)
    (ontable red)
    (ontable orange)
    (ontable purple)
    (ontable blue)
    (ontable green)

    ;; one stack observed: red on yellow
    (on red yellow)

    ;; clear relations
    (clear red)
    (clear orange)
    (clear purple)
    (clear blue)
    (clear green)

    ;; yellow is not clear because red is on it
    (not (clear yellow))
  )
  (:goal
    (and
      (on yellow purple)
      (on blue red)
      (on orange green)
    )
  )
)