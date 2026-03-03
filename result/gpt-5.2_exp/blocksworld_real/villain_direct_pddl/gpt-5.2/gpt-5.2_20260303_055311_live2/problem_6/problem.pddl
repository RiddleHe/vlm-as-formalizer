(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange red purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; observed blocks and their current relations
    (on blue purple)
    (ontable purple)
    (ontable orange)
    (ontable red)
    (ontable green)
    (ontable yellow)

    (clear blue)
    (clear orange)
    (clear red)
    (clear green)
    (clear yellow)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on orange red)
      (on red purple)
      (on purple green)
      (on green yellow)
      (ontable yellow)
    )
  )
)