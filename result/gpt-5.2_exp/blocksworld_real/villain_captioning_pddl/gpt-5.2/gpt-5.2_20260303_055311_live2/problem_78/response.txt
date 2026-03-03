(define (problem blocksworld_scene1_two_stacks)
  (:domain blocksworld)
  (:objects
    green blue purple orange yellow red - block
    robot1 - robot
  )
  (:init
    ;; right-side stack in the scene
    (on purple orange)
    (on orange blue)
    (ontable blue)

    ;; single blocks on the table
    (ontable green)
    (ontable yellow)
    (ontable red)

    ;; clear conditions
    (clear purple)
    (clear green)
    (clear yellow)
    (clear red)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over blue over purple
      (on green blue)
      (on blue purple)

      ;; stack 2: yellow over orange over red
      (on yellow orange)
      (on orange red)
    )
  )
)