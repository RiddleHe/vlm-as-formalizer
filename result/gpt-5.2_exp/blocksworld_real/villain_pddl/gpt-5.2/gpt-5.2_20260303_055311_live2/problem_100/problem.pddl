(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red yellow blue green orange purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable red)
    (ontable yellow)
    (ontable blue)
    (ontable green)
    (ontable orange)
    (ontable purple)

    (clear red)
    (clear yellow)
    (clear blue)
    (clear green)
    (clear orange)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on red yellow)
      (on yellow blue)
      (on green orange)
      (on orange purple)
    )
  )
)