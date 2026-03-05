(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks in the scene)
    (ontable blue)
    (ontable orange)
    (ontable green)
    (ontable red)
    (ontable yellow)
    (ontable purple)

    (clear blue)
    (clear orange)
    (clear green)
    (clear red)
    (clear yellow)
    (clear purple)

    ;; robot is available and not holding anything
    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on green red)
      (on yellow purple)
    )
  )
)