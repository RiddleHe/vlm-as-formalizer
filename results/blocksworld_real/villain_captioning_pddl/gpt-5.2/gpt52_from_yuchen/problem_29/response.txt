(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on orange green)
    (on green red)
    (ontable red)

    ;; single blocks on table
    (ontable blue)
    (ontable yellow)
    (ontable purple)

    ;; clear facts
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
      (ontable yellow)
    )
  )
)