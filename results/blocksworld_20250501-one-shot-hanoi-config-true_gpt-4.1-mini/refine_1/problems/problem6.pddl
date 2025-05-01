(define (problem blocksworld_task)
  (:domain blocksworld)
  (:objects
    pink purple yellow orange red - block
    robot1 - robot
  )
  (:init
    (ontable purple)
    (clear pink)
    (on pink purple)
    (ontable yellow)
    (ontable red)
    (on orange red)
    (clear orange)
    (clear yellow)
    (handempty robot1)
  )
  (:goal (and
    (on pink purple)
    (on yellow orange)
  ))
)