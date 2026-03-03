(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue purple orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Table placements (from the image: one existing stack purple on orange; others on table)
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable yellow)
    (ontable orange)

    ;; Existing stack
    (on purple orange)

    ;; Clear conditions
    (clear green)
    (clear blue)
    (clear red)
    (clear yellow)
    (clear purple)
  )
  (:goal
    (and
      (on orange yellow)
      (on green blue)
      (on red purple)
    )
  )
)