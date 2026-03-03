(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; stack relations (bottom to top): red, green, blue, purple, yellow
    (on green red)
    (on blue green)
    (on purple blue)
    (on yellow purple)

    ;; table placements
    (ontable red)
    (ontable orange)

    ;; clear blocks
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