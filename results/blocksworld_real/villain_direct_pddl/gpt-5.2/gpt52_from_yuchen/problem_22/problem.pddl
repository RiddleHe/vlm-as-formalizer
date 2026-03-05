(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange purple yellow red blue - block
    robot1 - robot
  )
  (:init
    ;; current stack in the image (bottom -> top):
    ;; purple, green, blue, red, orange
    (ontable purple)
    (on green purple)
    (on blue green)
    (on red blue)
    (on orange red)
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