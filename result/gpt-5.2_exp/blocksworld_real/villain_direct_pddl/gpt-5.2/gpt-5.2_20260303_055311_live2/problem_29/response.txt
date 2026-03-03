(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; robot initial state
    (handempty robot1)

    ;; block positions from the scene
    (ontable blue)
    (clear blue)

    (ontable yellow)
    (clear yellow)

    (ontable purple)
    (clear purple)

    (ontable red)
    (clear red)
    (on green red)
    (on orange green)
    (clear orange)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
    )
  )
)