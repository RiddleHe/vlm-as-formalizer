(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    red - block
    blue - block
    yellow - block
    orange - block
    purple - block
    green - block
  )
  (:init
    (handempty robot1)

    ;; Left stack: purple on orange
    (on purple orange)
    (ontable orange)
    (clear purple)

    ;; Green block is alone on the table
    (ontable green)
    (clear green)

    ;; Right stack: yellow on orange on blue (blue on table)
    (on yellow orange)
    (on orange blue)
    (ontable blue)
    (clear yellow)

    ;; Red block is alone on the table
    (ontable red)
    (clear red)
  )
  (:goal
    (and
      (on green purple)
      (on purple orange)
      (on orange yellow)
      (on yellow blue)
      (on blue red)
    )
  )
)