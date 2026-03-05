(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple yellow red - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (bottom to top): blue, yellow, purple, red, green, orange
    (ontable blue)
    (on yellow blue)
    (on purple yellow)
    (on red purple)
    (on green red)
    (on orange green)

    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (ontable red)
      (on yellow red)
      (on purple yellow)
      (on green purple)
      (on orange green)
      (on blue orange)
      (clear blue)
    )
  )
)