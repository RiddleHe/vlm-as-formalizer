(define (problem blocksworld_stack6)
  (:domain blocksworld)
  (:objects 
    green purple orange yellow blue red - block
    robot1 - robot
  )
  (:init
    (clear green)
    (clear purple)
    (clear orange)
    (clear yellow)
    (clear blue)
    (clear red)

    (ontable green)
    (ontable purple)
    (ontable orange)
    (ontable yellow)
    (ontable blue)
    (ontable red)

    (handempty robot1)
  )
  (:goal 
    (and 
      (on green purple)
      (on purple orange)
      (on orange yellow)
      (on yellow blue)
      (on blue red)
    )
  )
)