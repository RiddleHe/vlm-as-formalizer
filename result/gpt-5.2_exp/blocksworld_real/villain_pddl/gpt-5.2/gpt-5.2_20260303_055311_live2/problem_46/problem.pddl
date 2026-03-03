(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red yellow orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single vertical stack on the table.
    ;; Bottom to top: green, blue, purple, orange, yellow, red.
    (ontable green)
    (on blue green)
    (on purple blue)
    (on orange purple)
    (on yellow orange)
    (on red yellow)

    (clear red)
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow green)
      (on blue purple)
      (on orange red)
    )
  )
)