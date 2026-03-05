(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red green yellow purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current block configuration from the scene
    (on red blue)
    (clear red)

    (ontable blue)
    (ontable green)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    (clear green)
    (clear yellow)
    (clear purple)
    (clear orange)
    ;; blue is not clear because red is on it (no explicit negative predicate)
  )
  (:goal
    (and
      (on red green)
      (on yellow purple)
      (on blue orange)
    )
  )
)