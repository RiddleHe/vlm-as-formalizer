(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red green yellow purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene
    (on red blue)
    (ontable blue)

    ;; other blocks on the table
    (ontable green)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    ;; clear predicates
    (clear red)
    (clear green)
    (clear yellow)
    (clear purple)
    (clear orange)
    ;; blue is not clear because red is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on red green)
      (on yellow purple)
      (on blue orange)
    )
  )
)