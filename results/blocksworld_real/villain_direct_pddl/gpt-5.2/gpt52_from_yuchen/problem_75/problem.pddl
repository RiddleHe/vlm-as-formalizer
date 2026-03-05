(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple green yellow red orange - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable blue)
    (ontable purple)
    (ontable green)
    (ontable yellow)
    (ontable red)
    (ontable orange)

    (clear blue)
    (clear purple)
    (clear green)
    (clear yellow)
    (clear red)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue purple)
      (on green yellow)
      (on red orange)
    )
  )
)