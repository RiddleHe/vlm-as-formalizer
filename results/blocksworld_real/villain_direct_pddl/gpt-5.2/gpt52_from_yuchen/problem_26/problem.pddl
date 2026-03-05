(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; stack in the image (bottom to top): purple, blue, green, yellow, red, orange
    (ontable purple)
    (on blue purple)
    (on green blue)
    (on yellow green)
    (on red yellow)
    (on orange red)

    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks:
      (on green blue)
      (on purple orange)
      (on red yellow)
    )
  )
)