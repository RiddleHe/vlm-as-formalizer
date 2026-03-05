(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green - block
    yellow - block
    red - block
    blue - block
    purple - block
    orange - block
    robot1 - robot
  )
  (:init
    ;; observed tower (bottom to top): purple, blue, red, yellow, green
    (ontable purple)
    (on blue purple)
    (on red blue)
    (on yellow red)
    (on green yellow)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on blue purple)
      (on purple orange)
      (on orange green)
      (on green red)
    )
  )
)