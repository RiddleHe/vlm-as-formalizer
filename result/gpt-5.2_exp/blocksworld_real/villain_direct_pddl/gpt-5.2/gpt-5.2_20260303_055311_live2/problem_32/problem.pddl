(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue purple red green orange - block
    robot1 - robot
  )
  (:init
    ;; left stack: purple on blue on yellow (yellow on table)
    (on purple blue)
    (on blue yellow)
    (ontable yellow)
    (clear purple)

    ;; right stack: orange on red on green (green on table)
    (on orange red)
    (on red green)
    (ontable green)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on blue purple)
      (on purple red)
      (on red green)
      (on green orange)
    )
  )
)