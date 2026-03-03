(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple blue yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable green)
    (ontable purple)
    (ontable blue)
    (ontable yellow)
    (ontable orange)
    (ontable red)

    (clear green)
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: yellow over blue over purple
      (on yellow blue)
      (on blue purple)

      ;; stack 2: red over orange over green
      (on red orange)
      (on orange green)
    )
  )
)