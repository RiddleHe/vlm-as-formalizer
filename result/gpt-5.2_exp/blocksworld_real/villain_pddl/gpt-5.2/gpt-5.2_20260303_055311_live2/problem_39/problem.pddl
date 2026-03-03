(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple red green - block
    robot1 - robot
  )

  (:init
    ;; robot
    (handempty robot1)

    ;; current stacks seen in the image:
    ;; orange on blue
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; yellow on purple
    (on yellow purple)
    (ontable purple)
    (clear yellow)

    ;; single blocks on table
    (ontable red)
    (clear red)

    (ontable green)
    (clear green)
  )

  (:goal
    (and
      ;; Stack 1: orange over blue over yellow
      (on orange blue)
      (on blue yellow)
      (ontable yellow)

      ;; Stack 2: purple over red over green
      (on purple red)
      (on red green)
      (ontable green)

      ;; tops should be clear
      (clear orange)
      (clear purple)
    )
  )
)