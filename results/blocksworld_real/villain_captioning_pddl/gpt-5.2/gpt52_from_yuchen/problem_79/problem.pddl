(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue green red orange purple yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack on right: green on red on orange
    (on green red)
    (on red orange)
    (ontable orange)

    ;; remaining blocks on table
    (ontable blue)
    (ontable purple)
    (ontable yellow)

    ;; clear blocks
    (clear green)
    (clear blue)
    (clear purple)
    (clear yellow)
  )
  (:goal
    (and
      (on blue orange)
      (on purple green)
      (on yellow red)
    )
  )
)