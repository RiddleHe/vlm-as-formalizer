(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange purple blue yellow - block
    robot1 - robot
  )
  (:init
    ;; Stacks in the scene
    (on green red)
    (ontable red)
    (clear green)

    (on blue orange)
    (on orange purple)
    (on purple yellow)
    (ontable yellow)
    (clear blue)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on orange purple)
      (on blue yellow)
    )
  )
)