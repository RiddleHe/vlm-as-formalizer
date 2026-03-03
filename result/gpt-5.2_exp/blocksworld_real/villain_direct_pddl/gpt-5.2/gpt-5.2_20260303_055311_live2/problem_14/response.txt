(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple yellow orange blue red green - block
    robot1 - robot
  )
  (:init
    ;; current scene (from image)
    (ontable green)
    (on red green)
    (on orange red)
    (clear orange)

    (ontable blue)
    (on yellow blue)
    (on purple yellow)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: purple over yellow over orange
      (on yellow orange)
      (on purple yellow)
      ;; Stack 2: blue over red over green
      (on red green)
      (on blue red)
    )
  )
)