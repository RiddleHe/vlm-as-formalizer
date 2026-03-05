(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange purple yellow red green - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack A: purple on orange on blue (blue on table)
    (ontable blue)
    (on orange blue)
    (on purple orange)
    (clear purple)

    ;; Stack B: red on yellow (yellow on table)
    (ontable yellow)
    (on red yellow)
    (clear red)

    ;; Single block: green on table
    (ontable green)
    (clear green)
  )
  (:goal
    (and
      (ontable yellow)
      (on blue yellow)
      (on purple blue)
      (on orange purple)
      (on red orange)
      (on green red)
      (clear green)
    )
  )
)