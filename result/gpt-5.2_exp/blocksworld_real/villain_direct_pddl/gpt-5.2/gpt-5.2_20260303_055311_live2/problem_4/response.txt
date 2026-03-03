(define (problem blocks_scene_01)
  (:domain blocksworld)
  (:objects
    green - block
    yellow - block
    blue - block
    purple - block
    red - block
    orange - block
    robot1 - robot
  )
  (:init
    ;; current tower (bottom to top): green, yellow, blue, purple, red, orange
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
      ;; Stack 1: purple over green
      (on purple green)

      ;; Stack 2: blue over red over orange over yellow
      (on red orange)
      (on orange yellow)
      (on blue red)
    )
  )
)