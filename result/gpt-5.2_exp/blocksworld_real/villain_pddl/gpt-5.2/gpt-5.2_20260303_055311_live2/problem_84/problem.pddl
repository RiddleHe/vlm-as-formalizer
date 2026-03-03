(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue red yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable yellow)
    (ontable orange)
    (ontable purple)

    (clear green)
    (clear blue)
    (clear red)
    (clear yellow)
    (clear orange)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on green blue)
      (on blue red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
      (ontable purple)
    )
  )
)