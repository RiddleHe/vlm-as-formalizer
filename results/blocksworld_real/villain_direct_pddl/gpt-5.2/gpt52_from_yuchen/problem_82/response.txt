(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue - block
    yellow - block
    red - block
    orange - block
    green - block
    purple - block
  )
  (:init
    (handempty robot1)

    ;; Stack in the scene (bottom to top): green, orange, red, yellow, blue
    (ontable green)
    (on orange green)
    (on red orange)
    (on yellow red)
    (on blue yellow)

    ;; Separate block on table
    (ontable purple)

    ;; Clear blocks
    (clear blue)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: red over blue
      (on red blue)

      ;; Stack 2: yellow over green over orange over purple
      (on yellow green)
      (on green orange)
      (on orange purple)
    )
  )
)