(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue yellow purple red orange green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack in the scene: green on red on orange (all on table at bottom)
    (on green red)
    (on red orange)
    (ontable orange)
    (clear green)

    ;; single blocks on table
    (ontable blue)
    (clear blue)

    (ontable yellow)
    (clear yellow)

    (ontable purple)
    (clear purple)

    ;; blocks that are not clear because something is on them
    (not (clear red))
    (not (clear orange))
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