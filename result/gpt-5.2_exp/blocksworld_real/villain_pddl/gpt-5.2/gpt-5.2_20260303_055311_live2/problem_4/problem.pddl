(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow purple red orange - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Initial stack from visual inspection (bottom to top):
    ;; green, yellow, blue, purple, red, orange
    (ontable green)
    (on yellow green)
    (on blue yellow)
    (on purple blue)
    (on red purple)
    (on orange red)

    ;; Clear status
    (clear orange)
  )
  (:goal
    (and
      ;; Stack 1: purple over green
      (on purple green)

      ;; Stack 2: blue over red over orange over yellow
      (on red orange)
      (on orange yellow)
      (on blue red)
    )
  )
)