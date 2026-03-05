(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple orange yellow red green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable purple)
    (ontable blue)

    ;; stack relations (bottom -> top): purple -> orange -> yellow -> red -> green
    (on orange purple)
    (on yellow orange)
    (on red yellow)
    (on green red)

    ;; clear blocks
    (clear green)
    (clear blue)
  )
  (:goal
    (and
      (on blue purple)
      (on purple green)
      (on green red)
      (on red yellow)
      (on yellow orange)
    )
  )
)