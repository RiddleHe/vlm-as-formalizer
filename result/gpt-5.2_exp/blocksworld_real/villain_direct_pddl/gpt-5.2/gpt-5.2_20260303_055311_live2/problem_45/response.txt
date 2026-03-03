(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    purple - block
    green - block
    red - block
    yellow - block
    orange - block
    blue - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks in the scene)
    (ontable purple)
    (ontable green)
    (ontable red)
    (ontable yellow)
    (ontable orange)
    (ontable blue)

    (clear purple)
    (clear green)
    (clear red)
    (clear yellow)
    (clear orange)
    (clear blue)

    (handempty robot1)
  )
  (:goal
    (and
      (on purple green)
      (on red yellow)
      (on orange blue)
    )
  )
)