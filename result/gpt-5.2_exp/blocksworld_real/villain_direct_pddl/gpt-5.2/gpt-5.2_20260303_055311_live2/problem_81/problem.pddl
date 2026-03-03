(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; existing stack in the scene (bottom to top): red, green, blue, purple, yellow
    (ontable red)
    (on green red)
    (on blue green)
    (on purple blue)
    (on yellow purple)

    ;; separate block on the table
    (ontable orange)

    ;; clear conditions
    (clear yellow)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on purple yellow)
      (on blue orange)
    )
  )
)