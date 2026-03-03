(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple green red yellow orange - block
    robot1 - robot
  )
  (:init
    ;; Stack in the scene (bottom to top): purple, orange, yellow, red, green
    (ontable purple)
    (on orange purple)
    (on yellow orange)
    (on red yellow)
    (on green red)
    (clear green)

    ;; Blue block is separate on the table
    (ontable blue)
    (clear blue)

    ;; Robot is available and empty-handed
    (handempty robot1)
  )
  (:goal
    (and
      (ontable orange)
      (on yellow orange)
      (on red yellow)
      (on green red)
      (on purple green)
      (on blue purple)
    )
  )
)