(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green red orange purple blue - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Scene: one vertical stack (bottom->top): blue, purple, orange, red, green, yellow
    (ontable blue)
    (on purple blue)
    (on orange purple)
    (on red orange)
    (on green red)
    (on yellow green)

    ;; Clear/occupied
    (clear yellow)
  )
  (:goal
    (and
      ;; Create 3 stacks:
      (on purple yellow)
      (on green red)
      (on blue orange)
    )
  )
)