(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange - block
    red - block
    purple - block
    blue - block
    yellow - block
    green - block
    robot1 - robot
  )
  (:init
    ;; stack in the image (bottom to top): green, yellow, blue, purple, red, orange
    (ontable green)
    (on yellow green)
    (on blue yellow)
    (on purple blue)
    (on red purple)
    (on orange red)
    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: purple over green
      (on purple green)

      ;; stack 2: blue over red over orange over yellow
      (on red orange)
      (on orange yellow)
      (on blue red)
    )
  )
)