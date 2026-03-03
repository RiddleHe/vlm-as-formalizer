(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange purple green red blue - block
    robot1 - robot
  )
  (:init
    ;; initial tower (bottom to top): red, orange, blue, yellow, green, purple
    (ontable red)
    (on orange red)
    (on blue orange)
    (on yellow blue)
    (on green yellow)
    (on purple green)
    (clear purple)
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on purple green)
      (on red blue)
    )
  )
)