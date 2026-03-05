(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple - block
    blue - block
    green - block
    red - block
    orange - block
    yellow - block
    robot1 - robot
  )
  (:init
    ;; Left stack in the image: orange on yellow on blue (blue on table)
    (on orange yellow)
    (on yellow blue)
    (ontable blue)
    (clear orange)

    ;; Right stack in the image: purple on red on green (green on table)
    (on purple red)
    (on red green)
    (ontable green)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on purple blue)
      (on blue green)
      (on green red)
      (on red orange)
      (on orange yellow)
      (ontable yellow)
    )
  )
)