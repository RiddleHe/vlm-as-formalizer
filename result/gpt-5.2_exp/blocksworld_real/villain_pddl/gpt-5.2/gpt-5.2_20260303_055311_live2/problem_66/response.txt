(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue yellow red green purple orange - block
    robot1 - robot
  )
  (:init
    ;; left stack in the scene (bottom -> top): blue, yellow, red, green
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on green red)
    (clear green)

    ;; right stack in the scene (bottom -> top): orange, purple
    (ontable orange)
    (on purple orange)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: orange over green
      (on orange green)

      ;; stack 2: red over blue over purple over yellow
      (ontable yellow)
      (on purple yellow)
      (on blue purple)
      (on red blue)
    )
  )
)