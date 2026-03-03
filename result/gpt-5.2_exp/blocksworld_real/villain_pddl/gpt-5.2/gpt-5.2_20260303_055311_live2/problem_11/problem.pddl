(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    blue - block
    green - block
    purple - block
    orange - block
    red - block
    yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; observed stacks / placements from the image
    (on purple yellow)
    (ontable yellow)

    (on blue red)
    (on red green)
    (ontable green)

    (ontable orange)

    ;; clear blocks (no block on top)
    (clear purple)
    (clear blue)
    (clear orange)
  )
  (:goal
    (and
      ;; Stack 1: green over blue over purple over orange
      (on green blue)
      (on blue purple)
      (on purple orange)
      (ontable orange)

      ;; Stack 2: red over yellow
      (on red yellow)
      (ontable yellow)
    )
  )
)