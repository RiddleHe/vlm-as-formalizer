(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green red orange purple blue yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current stacks from the image:
    ;; Small stack: green on red (red on table)
    (on green red)
    (ontable red)
    (clear green)

    ;; Tall stack (bottom to top): yellow, purple, orange, blue
    (on purple yellow)
    (on orange purple)
    (on blue orange)
    (ontable yellow)
    (clear blue)
  )
  (:goal
    (and
      (on green red)
      (on orange purple)
      (on blue yellow)
    )
  )
)