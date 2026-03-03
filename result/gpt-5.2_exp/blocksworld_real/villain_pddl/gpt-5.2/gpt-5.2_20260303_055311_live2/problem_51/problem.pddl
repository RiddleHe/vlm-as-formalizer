(define (problem blocksworld_stacks_01)
  (:domain blocksworld)
  (:objects
    orange purple red yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except blue, which is on orange
    (ontable purple)
    (ontable yellow)
    (ontable orange)
    (ontable red)
    (ontable green)

    (on blue orange)

    ;; clear conditions (top faces free)
    (clear purple)
    (clear yellow)
    (clear red)
    (clear green)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on green blue)
    )
  )
)