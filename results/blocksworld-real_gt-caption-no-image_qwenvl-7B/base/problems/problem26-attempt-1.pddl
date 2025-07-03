(define (problem blocksworld_stack)
  (:domain blocksworld)
  (:objects
    orange - block
    red - block
    yellow - block
    green - block
    blue - block
    purple - block
    robot1 - robot
    table - table
  )
  (:init
    (clear orange)
    (clear red)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear purple)
    (ontable orange)
    (ontable red)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable purple)
    (handempty robot1)
    (on orange red)
    (on red yellow)
    (on yellow green)
    (on green blue)
    (on blue purple)
  )
  (:goal
    (and
      (on green blue)
      (on purple orange)
      (on red yellow)
    )
  )
)