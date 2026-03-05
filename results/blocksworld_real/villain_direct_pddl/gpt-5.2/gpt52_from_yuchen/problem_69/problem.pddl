(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange green purple red blue - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except the red-blue stack
    (ontable yellow)
    (ontable orange)
    (ontable green)
    (ontable purple)
    (ontable red)

    ;; stack visible in the scene
    (on blue red)

    ;; clear conditions
    (clear yellow)
    (clear orange)
    (clear green)
    (clear purple)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: yellow over orange
      (on yellow orange)

      ;; stack 2: green over purple over red over blue
      (on green purple)
      (on purple red)
      (on red blue)
    )
  )
)