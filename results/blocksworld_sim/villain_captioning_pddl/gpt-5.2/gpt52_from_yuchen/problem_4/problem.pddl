(define (problem blocksworld_stack_orange_yellow_blue_purple_red)
  (:domain blocksworld)
  (:objects
    orange blue yellow red purple - block
    robot1 - robot
  )
  (:init
    ;; blocks on the table
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable red)

    ;; existing stack
    (on purple red)

    ;; clear conditions
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow blue)
      (on blue purple)
      (on purple red)
    )
  )
)