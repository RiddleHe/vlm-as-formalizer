(define (problem blocksworld_problem1)
  (:domain blocksworld)
  (:objects
    blue orange yellow red green purple - block
    robot1 - robot
  )
  (:init
    ; Initial stacks:
    (ontable orange)
    (clear blue)
    (on blue orange)

    (ontable green)
    (clear red)
    (on red green)
    (clear yellow)
    (on yellow red)

    (ontable purple)
    (clear purple)

    (handempty robot1)
  )
  (:goal (and
    (on orange red)
    (on red yellow)
    (ontable yellow)

    (on blue purple)
    (on purple green)
    (ontable green)
  ))
)