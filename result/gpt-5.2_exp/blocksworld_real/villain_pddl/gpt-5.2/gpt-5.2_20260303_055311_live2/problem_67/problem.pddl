(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green yellow purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table (no stacks initially)
    (ontable red)
    (ontable green)
    (ontable yellow)
    (ontable purple)
    (ontable blue)
    (ontable orange)

    ;; all blocks have clear tops
    (clear red)
    (clear green)
    (clear yellow)
    (clear purple)
    (clear blue)
    (clear orange)

    ;; robot starts with empty hand
    (handempty robot1)
  )
  (:goal
    (and
      (on red green)
      (on yellow purple)
      (on blue orange)
    )
  )
)