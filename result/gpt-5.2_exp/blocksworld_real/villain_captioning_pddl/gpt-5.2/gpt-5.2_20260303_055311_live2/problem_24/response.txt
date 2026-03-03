(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; central stack: purple on blue on green (green on table)
    (on purple blue)
    (on blue green)
    (ontable green)

    ;; right stack: yellow on red (red on table)
    (on yellow red)
    (ontable red)

    ;; single block on table
    (ontable orange)

    ;; clear blocks
    (clear purple)
    (clear yellow)
    (clear orange)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
    )
  )
)