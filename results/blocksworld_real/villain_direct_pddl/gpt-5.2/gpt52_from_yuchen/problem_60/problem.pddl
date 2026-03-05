(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red green blue orange yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current stacks and table placements (from image)
    (ontable orange)
    (on blue orange)
    (on yellow blue)
    (on purple yellow)
    (clear purple)

    (ontable red)
    (clear red)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      ;; Stack 1: red over green
      (on red green)

      ;; Stack 2: orange over blue over purple over yellow
      (on orange blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)