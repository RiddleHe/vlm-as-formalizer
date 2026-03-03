(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    yellow orange green purple red blue - block
    robot1 - robot
  )
  (:init
    ;; robot initial state
    (handempty robot1)

    ;; table placements from the scene
    (ontable yellow)
    (ontable orange)
    (ontable green)
    (ontable purple)
    (ontable red)

    ;; stack in the scene: blue on red
    (on blue red)

    ;; clear conditions
    (clear yellow)
    (clear orange)
    (clear green)
    (clear purple)
    (clear blue)
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