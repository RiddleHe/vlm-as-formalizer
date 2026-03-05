(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue purple red green orange - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Left stack in the image: purple on blue on yellow (yellow on table)
    (on purple blue)
    (on blue yellow)
    (ontable yellow)
    (clear purple)

    ;; Right stack in the image: orange on red on green (green on table)
    (on orange red)
    (on red green)
    (ontable green)
    (clear orange)
  )
  (:goal
    (and
      (ontable orange)
      (on green orange)
      (on red green)
      (on purple red)
      (on blue purple)
      (on yellow blue)
      (clear yellow)
    )
  )
)