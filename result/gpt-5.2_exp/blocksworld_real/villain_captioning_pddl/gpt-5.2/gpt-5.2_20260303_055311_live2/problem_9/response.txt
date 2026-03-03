(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    red purple orange blue yellow green - block
    robot1 - robot
  )
  (:init
    ;; Left stack: red on purple on orange (orange on table)
    (on red purple)
    (on purple orange)
    (ontable orange)
    (clear red)

    ;; Right stack: blue on yellow on green (green on table)
    (on blue yellow)
    (on yellow green)
    (ontable green)
    (clear blue)

    ;; Robot initial state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange blue)
      (on red green)
      (on yellow purple)
    )
  )
)