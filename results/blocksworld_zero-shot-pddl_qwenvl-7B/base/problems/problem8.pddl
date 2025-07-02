(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    green - block
    yellow - block
    pink - block
    purple - block
    orange - block
    red - block
    robot1 - robot
  )
  (:init
    (clear green)
    (clear yellow)
    (clear pink)
    (clear purple)
    (clear orange)
    (clear red)
    (ontable green)
    (ontable yellow)
    (ontable pink)
    (ontable purple)
    (ontable orange)
    (ontable red)
    (handempty robot1)
  )
  (:goal
    (and
      (on green yellow)
      (on yellow pink)
      (on purple orange)
      (on orange red)
    )
  )
)