(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Scene state from visual inspection:
    ;; A 3-block stack: purple on blue on green (green on table)
    (on purple blue)
    (on blue green)
    (ontable green)
    (clear purple)

    ;; Single blocks on table
    (ontable orange)
    (clear orange)

    ;; A 2-block stack: yellow on red (red on table)
    (on yellow red)
    (ontable red)
    (clear yellow)
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