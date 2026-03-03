(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1 (left): yellow on red on orange (orange on table)
    (on yellow red)
    (on red orange)
    (ontable orange)
    (clear yellow)

    ;; Stack 2 (middle): purple on green (green on table)
    (on purple green)
    (ontable green)
    (clear purple)

    ;; Single block (right): blue on table
    (ontable blue)
    (clear blue)
  )
  (:goal
    (and
      (on purple green)
      (on yellow red)
      (on orange blue)
    )
  )
)