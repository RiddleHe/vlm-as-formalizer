(define (problem blocksworld_problem)
  (:domain blocksworld)
  (:objects 
    yellow green pink red purple - block
    robot1 - robot
  )
  (:init
    (ontable yellow)
    (ontable green)
    (ontable pink)
    (on purple red)
    (ontable red)
    (clear yellow)
    (clear green)
    (clear pink)
    (clear purple)
    (clear red)
    (handempty robot1)
  )
  (:goal (and 
    (on yellow green)
    (on green pink)
    (on red purple)
  ))
)