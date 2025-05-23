(define (problem blocksworld-task2)
  (:domain blocksworld)
  (:objects
    green yellow pink purple orange red - block
    robot1 - robot
  )
  (:init
    (ontable red)
    (on orange red)
    (on purple orange)
    (clear purple)
    (clear green)
    (handempty robot1)
  )
  (:goal (and
    (on green yellow)
    (on yellow pink)
    (ontable pink)
    (on purple orange)
    (on orange red)
    (ontable red)
  ))
)