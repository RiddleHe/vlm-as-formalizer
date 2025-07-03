(define (problem blocksworld_stack)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    purple - block
    green - block
    yellow - block
    blue - block
    orange - block
    red - block
  )
  (:init
    (handempty robot1)
    (on purple green)
    (on green yellow)
    (on yellow blue)
    (on blue orange)
    (on orange red)
    (ontable purple)
    (ontable green)
    (ontable yellow)
    (ontable blue)
    (ontable orange)
    (ontable red)
  )
  (:goal
    (and
      (on yellow orange)
      (on purple green)
      (on red blue)
    )
  )
)