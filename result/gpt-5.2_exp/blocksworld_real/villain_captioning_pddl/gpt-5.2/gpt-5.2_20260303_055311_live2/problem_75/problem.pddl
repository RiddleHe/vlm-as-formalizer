(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple green yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable blue)
    (ontable purple)
    (ontable green)
    (ontable yellow)
    (ontable orange)
    (ontable red)

    (clear blue)
    (clear purple)
    (clear green)
    (clear yellow)
    (clear orange)
    (clear red)

    ;; robot is available and not holding anything
    (handempty robot1)
  )
  (:goal
    (and
      (on blue purple)
      (on green yellow)
      (on red orange)
    )
  )
)