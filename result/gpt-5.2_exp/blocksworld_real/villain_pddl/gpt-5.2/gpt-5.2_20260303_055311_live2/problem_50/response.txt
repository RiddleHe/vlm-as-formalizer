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
    ;; Left stack (bottom to top): blue, yellow, orange
    (ontable blue)
    (on yellow blue)
    (on orange yellow)
    (clear orange)

    ;; Right stack (bottom to top): green, red, purple
    (ontable green)
    (on red green)
    (on purple red)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (ontable yellow)
      (on orange yellow)
      (on red orange)
      (on green red)
      (on blue green)
      (on purple blue)
      (clear purple)
    )
  )
)