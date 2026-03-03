(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple red orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on red purple)
    (on purple blue)
    (ontable blue)

    ;; loose blocks
    (ontable orange)
    (ontable yellow)
    (ontable green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over red
      (on green red)

      ;; stack 2: yellow over purple over blue over orange
      (on yellow purple)
      (on purple blue)
      (on blue orange)
    )
  )
)