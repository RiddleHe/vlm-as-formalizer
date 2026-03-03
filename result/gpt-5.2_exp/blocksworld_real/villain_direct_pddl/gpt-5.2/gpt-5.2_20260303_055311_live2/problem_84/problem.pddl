(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue red yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements observed
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable orange)
    (ontable red)

    ;; stack observed: purple on red
    (on purple red)

    ;; clear blocks
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear purple)
  )
  (:goal
    (and
      (on green blue)
      (on blue red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)