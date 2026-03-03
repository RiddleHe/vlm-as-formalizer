(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue yellow green orange purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks in the scene
    ;; current tall stack (bottom -> top): green, orange, red, yellow, blue
    (ontable green)
    (on orange green)
    (on red orange)
    (on yellow red)
    (on blue yellow)
    (clear blue)

    ;; separate block
    (ontable purple)
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