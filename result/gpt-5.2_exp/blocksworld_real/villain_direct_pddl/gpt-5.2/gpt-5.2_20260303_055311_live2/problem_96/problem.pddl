(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow purple blue green orange - block
    robot1 - robot
  )
  (:init
    ;; tower in the scene (bottom -> top): green, blue, purple, yellow, red
    (ontable green)
    (on blue green)
    (on purple blue)
    (on yellow purple)
    (on red yellow)

    ;; separate orange block on the table
    (ontable orange)

    ;; clear blocks
    (clear red)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: yellow over blue
      (on yellow blue)

      ;; stack 2: purple over red over green over orange
      (on purple red)
      (on red green)
      (on green orange)
    )
  )
)