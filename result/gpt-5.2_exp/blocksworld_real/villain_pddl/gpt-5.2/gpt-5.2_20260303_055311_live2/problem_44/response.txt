(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue green yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single vertical stack (top -> bottom):
    ;; blue, red, orange, purple, green, yellow (on table)
    (on blue red)
    (on red orange)
    (on orange purple)
    (on purple green)
    (on green yellow)
    (ontable yellow)

    ;; Clear/hand state
    (clear blue)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (top -> bottom):
      (on red blue)
      (on blue green)
      (on green yellow)
      (on yellow orange)
      (on orange purple)
      (ontable purple)
    )
  )
)