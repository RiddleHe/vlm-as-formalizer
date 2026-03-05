(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue red orange purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; initial stack observed (top to bottom): blue, red, orange, purple, green, yellow
    (on blue red)
    (on red orange)
    (on orange purple)
    (on purple green)
    (on green yellow)
    (ontable yellow)

    (clear blue)
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (top to bottom): red, blue, green, yellow, orange, purple
      (on red blue)
      (on blue green)
      (on green yellow)
      (on yellow orange)
      (on orange purple)
      (ontable purple)
      (clear red)
    )
  )
)