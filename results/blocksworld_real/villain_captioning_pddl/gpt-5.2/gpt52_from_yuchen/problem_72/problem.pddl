(define (problem blocksworld_scene_stack1)
  (:domain blocksworld)
  (:objects
    purple orange blue green red yellow - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable purple)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (ontable red)
    (ontable yellow)

    (clear purple)
    (clear orange)
    (clear blue)
    (clear green)
    (clear red)
    (clear yellow)

    ;; robot is available and empty-handed
    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue red)
      (on red yellow)
      (ontable yellow)
    )
  )
)