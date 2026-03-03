(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single stack on the table (bottom to top):
    ;; purple, blue, red, yellow, green.
    (ontable purple)
    (on blue purple)
    (on red blue)
    (on yellow red)
    (on green yellow)

    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (top to bottom):
      ;; yellow over blue over purple over orange over green over red
      (ontable red)
      (on green red)
      (on orange green)
      (on purple orange)
      (on blue purple)
      (on yellow blue)
      (clear yellow)
    )
  )
)