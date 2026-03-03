(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue purple green red yellow orange - block
    robot1 - robot
  )
  (:init
    ;; Current scene (from visual inspection):
    ;; A vertical stack (bottom->top): purple, orange, yellow, red, green
    (ontable purple)
    (on orange purple)
    (on yellow orange)
    (on red yellow)
    (on green red)
    (clear green)

    ;; Blue block is separate on the table
    (ontable blue)
    (clear blue)

    ;; Robot is available and not holding anything
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (bottom->top): orange, yellow, red, green, purple, blue
      (ontable orange)
      (on yellow orange)
      (on red yellow)
      (on green red)
      (on purple green)
      (on blue purple)
    )
  )
)