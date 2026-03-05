(define (problem blocksworld_stacks_2x3)
  (:domain blocksworld)
  (:objects
    blue pink red yellow orange green - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable blue)
    (ontable pink)
    (ontable red)
    (ontable yellow)
    (ontable orange)
    (ontable green)

    (clear blue)
    (clear pink)
    (clear red)
    (clear yellow)
    (clear orange)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue pink)
      (on pink red)
      (on yellow orange)
      (on orange green)
    )
  )
)