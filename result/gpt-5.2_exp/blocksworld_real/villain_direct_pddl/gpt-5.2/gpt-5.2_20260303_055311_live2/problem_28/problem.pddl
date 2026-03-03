(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange - block
    yellow - block
    green - block
    purple - block
    red - block
    blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current stack on the left: green on blue on orange (orange on table)
    (on green blue)
    (on blue orange)
    (ontable orange)
    (clear green)

    ;; remaining blocks are on the table and clear
    (ontable yellow)
    (clear yellow)

    (ontable red)
    (clear red)

    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
    )
  )
)