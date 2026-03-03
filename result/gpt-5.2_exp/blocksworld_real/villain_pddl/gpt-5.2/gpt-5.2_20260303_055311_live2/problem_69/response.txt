(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange green purple red blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack in the scene: blue on red (red is on table)
    (on blue red)
    (ontable red)
    (clear blue)

    ;; other blocks are on the table and clear
    (ontable yellow)
    (clear yellow)

    (ontable orange)
    (clear orange)

    (ontable green)
    (clear green)

    (ontable purple)
    (clear purple)

    ;; red has blue on it, so it is not clear
  )
  (:goal
    (and
      (on yellow orange)
      (ontable orange)

      (on green purple)
      (on purple red)
      (on red blue)
      (ontable blue)
    )
  )
)