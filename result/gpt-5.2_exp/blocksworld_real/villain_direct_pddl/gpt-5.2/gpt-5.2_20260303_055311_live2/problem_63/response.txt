(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow red purple green - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (ontable purple)
    (ontable green)

    (clear orange)
    (clear blue)
    (clear yellow)
    (clear red)
    (clear purple)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on blue red)
      (on purple green)
    )
  )
)