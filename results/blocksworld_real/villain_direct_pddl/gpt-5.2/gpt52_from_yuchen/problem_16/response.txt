(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange purple red yellow green - block
    robot1 - robot
  )
  (:init
    ;; stack 1 (left): purple on orange on blue
    (on purple orange)
    (on orange blue)
    (ontable blue)
    (clear purple)

    ;; stack 2 (middle/back): red on yellow
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; single block (right): green on table
    (ontable green)
    (clear green)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on red orange)
      (on orange purple)
      (on purple blue)
      (on blue yellow)
      (ontable yellow)
      (clear green)
    )
  )
)