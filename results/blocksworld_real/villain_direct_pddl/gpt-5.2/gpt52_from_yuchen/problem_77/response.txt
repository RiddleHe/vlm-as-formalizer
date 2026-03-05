(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue purple green red yellow orange - block
    robot1 - robot
  )
  (:init
    ;; Current scene: a single stack (top to bottom): green, red, yellow, orange, purple
    (on green red)
    (on red yellow)
    (on yellow orange)
    (on orange purple)
    (ontable purple)

    ;; Blue block is separate on the table
    (ontable blue)

    ;; Clear blocks
    (clear green)
    (clear blue)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (top to bottom): blue, purple, green, red, yellow, orange
      (on blue purple)
      (on purple green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (ontable orange)
    )
  )
)