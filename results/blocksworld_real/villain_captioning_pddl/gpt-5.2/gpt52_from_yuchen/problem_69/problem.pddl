(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple orange yellow green red blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; on-table blocks
    (ontable purple)
    (ontable orange)
    (ontable yellow)
    (ontable green)
    (ontable red)

    ;; stack relation in the scene
    (on blue red)

    ;; clear conditions
    (clear purple)
    (clear orange)
    (clear yellow)
    (clear green)
    (clear blue)
    ;; red is not clear because blue is on it
  )
  (:goal
    (and
      ;; Stack 1: yellow over orange
      (on yellow orange)

      ;; Stack 2: green over purple over red over blue
      (on red blue)
      (on purple red)
      (on green purple)
    )
  )
)