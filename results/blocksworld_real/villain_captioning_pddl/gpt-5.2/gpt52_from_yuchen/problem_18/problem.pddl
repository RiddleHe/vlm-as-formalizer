(define (problem blocksworld_scene_stack1)
  (:domain blocksworld)
  (:objects
    red blue yellow orange purple green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack on left: orange (table) with purple on top
    (ontable orange)
    (on purple orange)
    (clear purple)

    ;; single green block
    (ontable green)
    (clear green)

    ;; right stack: red (table) -> blue -> orange -> yellow
    (ontable red)
    (on blue red)
    (on orange blue)
    (on yellow orange)
    (clear yellow)
  )
  (:goal
    (and
      (on blue red)
      (on yellow blue)
      (on orange yellow)
      (on purple orange)
      (on green purple)
    )
  )
)