(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple blue orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear in the initial scene
    (ontable green)
    (ontable purple)
    (ontable blue)
    (ontable orange)
    (ontable red)
    (ontable yellow)

    (clear green)
    (clear purple)
    (clear blue)
    (clear orange)
    (clear red)
    (clear yellow)

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