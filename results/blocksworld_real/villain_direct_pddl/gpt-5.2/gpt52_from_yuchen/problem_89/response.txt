(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue red orange purple green - block
    robot1 - robot
  )
  (:init
    ;; stack 1 (left): yellow on blue, blue on table
    (on yellow blue)
    (ontable blue)
    (clear yellow)

    ;; stack 2 (right): green on purple on orange, orange on table
    (on green purple)
    (on purple orange)
    (ontable orange)
    (clear green)

    ;; single block on table
    (ontable red)
    (clear red)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      (on purple green)
      (on green blue)
      (on blue yellow)
      (ontable yellow)

      (on orange red)
      (ontable red)
    )
  )
)