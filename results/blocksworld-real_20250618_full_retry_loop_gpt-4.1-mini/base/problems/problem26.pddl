(define (problem blocksworld-real-002)
  (:domain blocksworld)
  (:objects
    red yellow green blue purple orange - block
    robot1 - robot
  )
  (:init
    (ontable red)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable purple)
    (ontable orange)
    (clear red)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear purple)
    (clear orange)
    (handempty robot1)
  )
  (:goal (and
    (on green blue)
    (on purple orange)
    (on red yellow)
  ))
)