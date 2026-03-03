(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    orange - block
    purple - block
    red - block
    green - block
    yellow - block
    blue - block
  )
  (:init
    (handempty robot1)

    ;; Left stack (bottom to top): orange, purple, red
    (ontable orange)
    (on purple orange)
    (on red purple)
    (clear red)

    ;; Right stack (bottom to top): green, yellow, blue
    (ontable green)
    (on yellow green)
    (on blue yellow)
    (clear blue)
  )
  (:goal
    (and
      (on orange blue)
      (on red green)
      (on yellow purple)
    )
  )
)