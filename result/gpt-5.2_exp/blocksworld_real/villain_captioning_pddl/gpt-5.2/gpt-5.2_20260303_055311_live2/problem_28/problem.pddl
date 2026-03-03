(define (problem blocksworld_stack_goal)
  (:domain blocksworld)
  (:objects
    green blue orange yellow red purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack (left)
    (on green blue)
    (on blue orange)
    (ontable orange)

    ;; loose blocks on table
    (ontable yellow)
    (ontable red)
    (ontable purple)

    ;; clear conditions
    (clear green)
    (clear yellow)
    (clear red)
    (clear purple)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      (ontable blue)
      (on red blue)
      (on purple red)
      (on green purple)
      (on yellow green)
      (on orange yellow)
    )
  )
)