(define (problem blocksworld-stack)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    table - table
    orange - block
    green - block
    red - block
    purple - block
    yellow - block
    blue - block
  )
  (:init
    (clear orange)
    (clear green)
    (clear red)
    (clear purple)
    (clear yellow)
    (clear blue)
    (ontable orange)
    (ontable green)
    (ontable red)
    (ontable purple)
    (ontable yellow)
    (ontable blue)
    (handempty robot1)
    (on table robot1)
  )
  (:goal
    (and
      (clear blue)
      (clear orange)
      (clear green)
      (clear purple)
      (clear yellow)
      (on blue orange)
      (on orange green)
      (on green red)
      (on red purple)
      (on purple yellow)
      (on yellow blue)
    )
  )
)