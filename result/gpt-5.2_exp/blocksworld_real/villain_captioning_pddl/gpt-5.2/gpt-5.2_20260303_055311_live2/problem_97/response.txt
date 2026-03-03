(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    blue orange green red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; all blocks are on the table and clear (no stacks initially)
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
  )
  (:goal
    (and
      (on blue orange)
      (on green red)
      (on yellow purple)
    )
  )
)