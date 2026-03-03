(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange purple blue yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1 in the scene: green on red (both on table as a stack)
    (on green red)
    (ontable red)
    (clear green)

    ;; Stack 2 in the scene: blue on orange on purple on yellow (yellow on table)
    (on blue orange)
    (on orange purple)
    (on purple yellow)
    (ontable yellow)
    (clear blue)
  )
  (:goal
    (and
      ;; Create 3 stacks as instructed
      (on green red)
      (on orange purple)
      (on blue yellow)
    )
  )
)