(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange green purple yellow red blue - block
    robot1 - robot
  )
  (:init
    ;; current stack in the scene (top to bottom): orange, red, blue, green, purple, yellow
    (on orange red)
    (on red blue)
    (on blue green)
    (on green purple)
    (on purple yellow)

    (ontable yellow)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: green over orange
      (on green orange)

      ;; Stack 2: purple over yellow over red over blue
      (on purple yellow)
      (on yellow red)
      (on red blue)
    )
  )
)