(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    blue green yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack
    (ontable blue)
    (on green blue)
    (clear green)

    ;; right stack
    (ontable orange)
    (on yellow orange)
    (clear yellow)

    ;; single blocks on table
    (ontable purple)
    (clear purple)
    (ontable red)
    (clear red)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on yellow green)
      (on green blue)
      (ontable blue)
    )
  )
)