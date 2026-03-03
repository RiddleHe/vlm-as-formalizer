(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red yellow blue orange green purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1 in the scene: orange on yellow
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    ;; stack 2 in the scene: blue on red
    (on blue red)
    (ontable red)
    (clear blue)

    ;; single blocks on table
    (ontable green)
    (clear green)
    (ontable purple)
    (clear purple)

    ;; blocks that have something on them are not clear
    (not (clear yellow))
    (not (clear red))
  )
  (:goal
    (and
      (on red yellow)
      (on yellow blue)
      (ontable blue)
      (clear red)

      (on orange green)
      (on green purple)
      (ontable purple)
      (clear orange)
    )
  )
)