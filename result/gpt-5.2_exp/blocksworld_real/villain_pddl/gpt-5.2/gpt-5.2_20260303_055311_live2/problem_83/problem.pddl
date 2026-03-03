(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; From the image: a vertical stack (bottom->top): purple, red, yellow, blue, green
    (on red purple)
    (on yellow red)
    (on blue yellow)
    (on green blue)

    ;; Bottom blocks on the table
    (ontable purple)

    ;; Separate orange block on the table
    (ontable orange)
    (clear orange)

    ;; Top of the tower is clear
    (clear green)

    ;; Robot is available and starts with empty hand
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (bottom->top): green, yellow, orange, blue, red, purple
      (ontable green)
      (on yellow green)
      (on orange yellow)
      (on blue orange)
      (on red blue)
      (on purple red)
    )
  )
)