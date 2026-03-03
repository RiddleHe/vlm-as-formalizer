(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; observed stacks in the scene
    (on yellow red)
    (on orange blue)

    ;; table placements
    (ontable red)
    (ontable blue)
    (ontable green)
    (ontable purple)

    ;; clear blocks (nothing on top)
    (clear yellow)
    (clear orange)
    (clear green)
    (clear purple)
  )
  (:goal
    (and
      (on green blue)
      (on orange red)
      (on yellow purple)
    )
  )
)