(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    blue green yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current stacks from the image:
    ;; Stack 1 (bottom to top): blue, green, yellow, purple
    (ontable blue)
    (on green blue)
    (on yellow green)
    (on purple yellow)
    (clear purple)

    ;; Stack 2 (bottom to top): red, orange
    (ontable red)
    (on orange red)
    (clear orange)
  )
  (:goal
    (and
      (on green red)
      (on purple blue)
      (on yellow orange)
    )
  )
)