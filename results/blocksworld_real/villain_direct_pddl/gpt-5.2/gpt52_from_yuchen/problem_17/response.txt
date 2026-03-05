(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple yellow red - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block configuration from the image:
    ;; A single stack (bottom to top): yellow, purple, green, orange, blue
    (ontable yellow)
    (on purple yellow)
    (on green purple)
    (on orange green)
    (on blue orange)
    (clear blue)

    ;; Red block is separate on the table
    (ontable red)
    (clear red)
  )
  (:goal
    (and
      ;; Stack 1: orange over purple over blue  (bottom to top: blue, purple, orange)
      (ontable blue)
      (on purple blue)
      (on orange purple)

      ;; Stack 2: yellow over red over green (bottom to top: green, red, yellow)
      (ontable green)
      (on red green)
      (on yellow red)
    )
  )
)