(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow blue green orange purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable red)
    (ontable yellow)
    (ontable blue)
    (ontable green)
    (ontable orange)
    (ontable purple)

    (clear red)
    (clear yellow)
    (clear blue)
    (clear green)
    (clear orange)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over blue
      (on red yellow)
      (on yellow blue)

      ;; stack 2: green over orange over purple
      (on green orange)
      (on orange purple)
    )
  )
)