(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    green blue purple orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block relations from the scene
    (on purple orange)

    (ontable green)
    (ontable blue)
    (ontable orange)
    (ontable red)
    (ontable yellow)

    ;; Clear conditions
    (clear green)
    (clear blue)
    (clear purple)
    (clear red)
    (clear yellow)
  )
  (:goal
    (and
      (on orange yellow)
      (on green blue)
      (on red purple)
    )
  )
)