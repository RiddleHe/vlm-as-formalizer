(define (problem stack1)
  (:domain blocksworld)
  (:objects
    blue green red purple yellow orange - block
    robot1 - robot
  )
  (:init
    (ontable blue)
    (clear orange)
    (clear purple)
    (clear yellow)
    (clear red)
    (handempty robot1)
    (on orange green)
    (on green red)
    (on red purple)
    (on purple yellow)
    (on yellow blue)
  )
  (:goal
    (and
      (ontable red)
      (on yellow red)
      (on purple yellow)
      (on green purple)
      (on orange green)
      (on blue orange)
      (clear blue)
    )
  )
)