(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    yellow green red blue purple orange - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable yellow)
    (ontable green)
    (ontable red)
    (ontable blue)
    (ontable purple)
    (ontable orange)

    (clear yellow)
    (clear green)
    (clear red)
    (clear blue)
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