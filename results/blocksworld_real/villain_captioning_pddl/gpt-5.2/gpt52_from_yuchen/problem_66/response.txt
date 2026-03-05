(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue yellow red green orange purple - block
    robot1 - robot
  )
  (:init
    ;; left stack (bottom -> top): blue, yellow, red, green
    (ontable blue)
    (on yellow blue)
    (on red yellow)
    (on green red)

    ;; right stack (bottom -> top): orange, purple
    (ontable orange)
    (on purple orange)

    ;; clear blocks
    (clear green)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: orange over green
      (on orange green)

      ;; Stack 2: red over blue over purple over yellow
      (on red blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)