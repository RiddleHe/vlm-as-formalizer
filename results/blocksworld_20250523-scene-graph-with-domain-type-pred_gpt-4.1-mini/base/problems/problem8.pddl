(define (problem blocksworld-task1)
  (:domain blocksworld)
  (:objects
    green yellow pink purple orange red - block
    robot1 - robot
  )
  (:init
    (on green yellow)
    (on yellow pink)
    (on pink red)
    (on purple orange)
    (on orange red)
    (ontable red)
    (clear green)
    (clear purple)
    (handempty robot1)
  )
  (:goal (and
    (on green yellow)
    (on yellow pink)
    (on pink red)
    (on purple orange)
    (on orange red)
  ))
)