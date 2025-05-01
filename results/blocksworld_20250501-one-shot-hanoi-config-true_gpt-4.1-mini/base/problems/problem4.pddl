(define (problem stack_blocks)
  (:domain blocksworld)
  (:objects
    orange yellow blue purple red - block
    robot1 - robot
  )
  (:init
    (ontable orange)
    (clear orange)
    (ontable yellow)
    (clear yellow)
    (ontable blue)
    (clear blue)
    (on purple red)
    (clear purple)
    (handempty robot1)
  )
  (:goal (and
    (on orange yellow)
    (on yellow blue)
    (on purple red)
  ))
)