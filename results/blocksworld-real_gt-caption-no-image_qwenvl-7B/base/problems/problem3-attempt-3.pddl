(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    table - table
    purple - block
    yellow - block
    red - block
    orange - block
    blue - block
    green - block
  )
  (:init
    (clear purple)
    (clear yellow)
    (clear red)
    (clear orange)
    (clear blue)
    (clear green)
    (ontable purple)
    (ontable yellow)
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (handempty robot1)
    (clear table)
    (ontable table)
  )
  (:goal
    (and
      (on purple red)
      (on yellow orange)
      (on orange green)
      (on green blue)
      (clear purple)
      (clear yellow)
      (clear red)
      (clear orange)
      (clear blue)
      (ontable green)
    )
  )
)