(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green yellow purple orange red - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Left tall stack (bottom -> top): blue, green, yellow, purple
    (ontable blue)
    (on green blue)
    (on yellow green)
    (on purple yellow)
    (clear purple)

    ;; Right small stack (bottom -> top): red, orange
    (ontable red)
    (on orange red)
    (clear orange)
  )

  (:goal
    (and
      ;; Create 3 stacks as instructed:
      (on green red)
      (on purple blue)
      (on yellow orange)
    )
  )
)