(define (problem blocksworld_colorstack_1)
  (:domain blocksworld)
  (:objects
    purple orange blue yellow green red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear in the observed scene
    (ontable purple)
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable green)
    (ontable red)

    (clear purple)
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear green)
    (clear red)

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
      (clear orange)
    )
  )
)