(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack in the scene: orange on green on red (all clear relations accordingly)
    (on orange green)
    (on green red)
    (ontable red)
    (clear orange)

    ;; Other blocks on the table
    (ontable blue)
    (clear blue)

    (ontable purple)
    (clear purple)

    (ontable yellow)
    (clear yellow)

    ;; Blocks that have something on them are not clear
    (not (clear green))
    (not (clear red))
  )

  (:goal
    (and
      ;; Desired single stack (top to bottom):
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
      (ontable yellow)
    )
  )
)