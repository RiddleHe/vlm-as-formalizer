(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange green purple red blue - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene
    (on blue red)

    ;; blocks on the table
    (ontable yellow)
    (ontable orange)
    (ontable green)
    (ontable purple)

    ;; clear blocks
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear green)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1
      (on yellow orange)

      ;; stack 2 (green over purple over red over blue)
      (on green purple)
      (on purple red)
      (on red blue)
    )
  )
)