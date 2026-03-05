(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    red purple blue orange green yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack
    (on red purple)
    (on purple blue)
    (ontable blue)

    ;; single blocks on table
    (ontable orange)
    (ontable green)
    (ontable yellow)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear green)
    (clear yellow)
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