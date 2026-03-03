(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple green red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear in the shown scene
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable green)
    (ontable red)

    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)
    (clear green)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: purple over blue over yellow over orange
      (on purple blue)
      (on blue yellow)
      (on yellow orange)

      ;; stack 2: green over red
      (on green red)
    )
  )
)