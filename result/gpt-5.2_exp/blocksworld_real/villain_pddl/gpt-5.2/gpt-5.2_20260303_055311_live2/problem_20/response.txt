(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red orange yellow purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks on table
    (ontable blue)
    (ontable green)
    (ontable red)
    (ontable orange)

    ;; existing stack on the right: purple on orange on yellow (top to bottom)
    (on purple orange)
    (on orange yellow)
    (ontable yellow)

    ;; clear blocks
    (clear blue)
    (clear green)
    (clear red)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: yellow over orange over red over purple (top to bottom)
      (on yellow orange)
      (on orange red)
      (on red purple)

      ;; Stack 2: blue over green
      (on blue green)
    )
  )
)