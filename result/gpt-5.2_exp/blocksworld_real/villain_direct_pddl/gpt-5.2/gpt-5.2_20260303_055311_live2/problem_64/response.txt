(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue yellow purple red orange green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks / table layout from the image
    (ontable blue)
    (clear blue)

    (ontable yellow)
    (clear yellow)

    (ontable purple)
    (clear purple)

    (ontable orange)
    (on red orange)
    (on green red)
    (clear green)
  )
  (:goal
    (and
      ;; Stack 1: orange over blue over red over purple
      (on orange blue)
      (on blue red)
      (on red purple)

      ;; Stack 2: yellow over green
      (on yellow green)
    )
  )
)