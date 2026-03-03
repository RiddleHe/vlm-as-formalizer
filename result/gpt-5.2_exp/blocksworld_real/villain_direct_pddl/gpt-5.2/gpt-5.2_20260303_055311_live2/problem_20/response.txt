(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Blocks on table
    (ontable blue)
    (ontable green)
    (ontable red)

    ;; Pre-existing stack on the right: purple on orange on yellow (yellow on table)
    (on purple orange)
    (on orange yellow)
    (ontable yellow)

    ;; Clear conditions
    (clear blue)
    (clear green)
    (clear red)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: yellow over orange over red over purple
      (on yellow orange)
      (on orange red)
      (on red purple)

      ;; Stack 2: blue over green
      (on blue green)
    )
  )
)