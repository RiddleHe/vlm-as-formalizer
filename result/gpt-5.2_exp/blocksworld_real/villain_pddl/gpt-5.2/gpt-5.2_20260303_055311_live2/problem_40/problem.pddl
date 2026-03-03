(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow purple green red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
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
      (on purple blue)
      (on blue yellow)
      (on yellow orange)
      (on green red)
    )
  )
)