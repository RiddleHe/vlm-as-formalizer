(define (problem blocksworld_scene_stacks)
  (:domain blocksworld)
  (:objects
    purple yellow blue orange red green - block
    robot1 - robot
  )
  (:init
    ;; Stack A: purple on yellow on blue (blue on table)
    (ontable blue)
    (on yellow blue)
    (on purple yellow)
    (clear purple)

    ;; Stack B: orange on red on green (green on table)
    (ontable green)
    (on red green)
    (on orange red)
    (clear orange)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: purple over yellow over orange
      (on yellow orange)
      (on purple yellow)

      ;; Stack 2: blue over red over green
      (on red green)
      (on blue red)
    )
  )
)