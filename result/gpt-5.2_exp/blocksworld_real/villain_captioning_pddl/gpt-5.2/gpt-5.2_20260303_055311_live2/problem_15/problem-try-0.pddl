(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    green yellow red blue purple - block
  )
  (:init
    (handempty robot1)

    ;; stack as observed (top to bottom):
    (on green yellow)
    (on yellow red)
    (on red blue)
    (on blue purple)
    (ontable purple)

    (clear green)
  )
  (:goal
    (and
      ;; requested single stack (top to bottom):
      (on yellow blue)
      (on blue purple)
      (on purple orange)
      (on orange green)
      (on green red)
      (ontable red)
    )
  )
)