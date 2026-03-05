(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow green blue purple orange - block
    robot1 - robot
  )
  (:init
    ;; left stack (top to bottom): red on yellow on green (green on table)
    (on red yellow)
    (on yellow green)
    (ontable green)
    (clear red)

    ;; right stack (top to bottom): purple on blue on orange (orange on table)
    (on purple blue)
    (on blue orange)
    (ontable orange)
    (clear purple)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      (on blue purple)
      (on red yellow)
      (on green orange)
    )
  )
)