(define (problem blocksworld_stack_pryg)
  (:domain blocksworld)
  (:objects
    green - block
    yellow - block
    pink - block
    red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable green)
    (ontable yellow)
    (ontable pink)
    (ontable red)

    (clear green)
    (clear yellow)
    (clear pink)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow green)
      (on red yellow)
      (on pink red)
    )
  )
)