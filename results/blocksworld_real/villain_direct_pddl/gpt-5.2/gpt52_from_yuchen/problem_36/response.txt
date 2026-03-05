(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red yellow blue orange green purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current block configuration from the image
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    (on blue red)
    (ontable red)
    (clear blue)

    (ontable green)
    (clear green)

    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: red over yellow over blue (top to bottom: red, yellow, blue)
      (on red yellow)
      (on yellow blue)
      (ontable blue)

      ;; Stack 2: orange over green over purple (top to bottom: orange, green, purple)
      (on orange green)
      (on green purple)
      (ontable purple)
    )
  )
)