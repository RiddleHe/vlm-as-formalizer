(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple red green orange yellow blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack: orange on yellow on blue (blue on table)
    (ontable blue)
    (on yellow blue)
    (on orange yellow)
    (clear orange)

    ;; right stack: purple on red on green (green on table)
    (ontable green)
    (on red green)
    (on purple red)
    (clear purple)
  )
  (:goal
    (and
      (ontable yellow)
      (on orange yellow)
      (on red orange)
      (on green red)
      (on blue green)
      (on purple blue)
    )
  )
)