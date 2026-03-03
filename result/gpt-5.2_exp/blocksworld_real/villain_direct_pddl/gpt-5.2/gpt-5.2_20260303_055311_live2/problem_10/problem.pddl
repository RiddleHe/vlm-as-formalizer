(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red yellow purple orange - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable blue)
    (ontable green)
    (ontable red)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    (clear blue)
    (clear green)
    (clear red)
    (clear yellow)
    (clear purple)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue green)
      (on red yellow)
      (on purple orange)
    )
  )
)