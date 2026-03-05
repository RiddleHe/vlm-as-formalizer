(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow - block
    purple - block
    green  - block
    red    - block
    blue   - block
    orange - block
    robot1 - robot
  )
  (:init
    ;; Stack in the image (top to bottom): yellow, purple, green, red, blue, orange
    (on yellow purple)
    (on purple green)
    (on green red)
    (on red blue)
    (on blue orange)
    (ontable orange)

    (clear yellow)
    (handempty robot1)
  )
  (:goal
    (and
      (on orange red)
      (on yellow blue)
      (on purple green)
    )
  )
)