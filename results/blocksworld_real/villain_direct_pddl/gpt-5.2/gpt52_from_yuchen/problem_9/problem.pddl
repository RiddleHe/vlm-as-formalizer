(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange purple blue yellow green - block
    robot1 - robot
  )

  (:init
    ;; robot
    (handempty robot1)

    ;; stack 1 (left): red on purple on orange (orange on table)
    (on red purple)
    (on purple orange)
    (ontable orange)
    (clear red)

    ;; stack 2 (right): blue on yellow on green (green on table)
    (on blue yellow)
    (on yellow green)
    (ontable green)
    (clear blue)

    ;; blocks not supporting anything else
    (clear red)
    (clear blue)
  )

  (:goal
    (and
      (on orange blue)
      (on red green)
      (on yellow purple)
    )
  )
)