(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red orange green blue yellow purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks in the scene)
    (ontable red)
    (ontable orange)
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)

    (clear red)
    (clear orange)
    (clear green)
    (clear blue)
    (clear yellow)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange red)
      (on green orange)
      (on purple yellow)
      (on blue purple)
    )
  )
)