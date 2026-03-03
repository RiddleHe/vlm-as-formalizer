(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    red orange blue yellow green purple - block
    robot1 - robot
  )
  (:init
    ;; block positions
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (ontable purple)
    (on yellow green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)
    ;; green is not clear because yellow is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue red)
    )
  )
)