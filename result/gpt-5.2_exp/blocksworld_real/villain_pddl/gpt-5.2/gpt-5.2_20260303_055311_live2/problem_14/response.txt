(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    purple yellow orange blue red green - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1 in the scene: orange on red on green (green on table)
    (on orange red)
    (on red green)
    (ontable green)
    (clear orange)

    ;; Stack 2 in the scene: purple on yellow on blue (blue on table)
    (on purple yellow)
    (on yellow blue)
    (ontable blue)
    (clear purple)
  )
  (:goal
    (and
      ;; Goal stack A: purple over yellow over orange (orange on table or on another block is not required beyond these relations)
      (on purple yellow)
      (on yellow orange)

      ;; Goal stack B: blue over red over green
      (on blue red)
      (on red green)
    )
  )
)