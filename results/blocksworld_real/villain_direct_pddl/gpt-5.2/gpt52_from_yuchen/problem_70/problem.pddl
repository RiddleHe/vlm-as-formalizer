(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple yellow blue green orange red - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; Stack (bottom -> top): purple, yellow, blue, green, orange
    (ontable purple)
    (on yellow purple)
    (on blue yellow)
    (on green blue)
    (on orange green)
    (clear orange)

    ;; Red block is alone on the table
    (ontable red)
    (clear red)
  )
  (:goal
    (and
      ;; Goal stack (bottom -> top): green, purple, blue, orange, red, yellow
      (ontable green)
      (on purple green)
      (on blue purple)
      (on orange blue)
      (on red orange)
      (on yellow red)
      (clear yellow)
    )
  )
)