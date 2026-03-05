(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple blue green orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; stack in the middle: purple on blue on green
    (on purple blue)
    (on blue green)
    (ontable green)

    ;; other blocks on the table
    (ontable orange)
    (ontable red)
    (on yellow red)

    ;; clear conditions
    (clear purple)
    (clear yellow)
    (clear orange)

    ;; robot state
    (handempty robot1)
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