(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple blue red orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stacks observed in the scene:
    (on red orange)
    (on blue yellow)

    ;; table placements (bottom blocks / single blocks)
    (ontable orange)
    (ontable yellow)
    (ontable purple)
    (ontable green)

    ;; clear blocks (no block on top)
    (clear red)
    (clear blue)
    (clear purple)
    (clear green)

    ;; not clear (have something on top)
    ;; orange has red on it; yellow has blue on it
  )
  (:goal
    (and
      (on purple blue)
      (on red orange)
      (on yellow green)
    )
  )
)