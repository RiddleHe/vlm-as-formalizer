(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue green orange purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; initial stack observed (bottom to top): blue, yellow, purple, red, green, orange
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
      ;; goal stack (bottom to top): red, yellow, purple, green, orange, blue
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