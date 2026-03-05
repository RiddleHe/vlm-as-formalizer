(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange red purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on purple red)

    ;; table placements
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable orange)

    ;; clear blocks
    (clear purple)
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)

    ;; robot state
    (handempty robot1)
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