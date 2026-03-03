(define (problem blocksworld_scene_01)
  (:domain blocksworld)
  (:objects
    red blue yellow green orange purple - block
    robot1 - robot
  )
  (:init
    ;; From visual inspection:
    ;; One stack (bottom->top): green, orange, red, yellow, blue
    (ontable green)
    (on orange green)
    (on red orange)
    (on yellow red)
    (on blue yellow)

    ;; Purple block is separate on the table
    (ontable purple)

    ;; Clear status
    (clear blue)
    (clear purple)

    ;; Robot is available and empty-handed
    (handempty robot1)
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