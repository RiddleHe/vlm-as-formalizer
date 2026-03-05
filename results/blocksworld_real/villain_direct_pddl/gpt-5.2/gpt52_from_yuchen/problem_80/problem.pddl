(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red blue green yellow purple orange - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable red)
    (ontable blue)
    (ontable green)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    (clear red)
    (clear blue)
    (clear green)
    (clear yellow)
    (clear purple)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow green)
      (on red blue)
      (on purple orange)
    )
  )
)