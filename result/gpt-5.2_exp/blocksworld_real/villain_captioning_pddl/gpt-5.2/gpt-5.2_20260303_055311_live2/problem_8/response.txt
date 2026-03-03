(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    green purple blue yellow red orange - block
    robot1 - robot
  )
  (:init
    (ontable green)
    (ontable purple)
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (ontable orange)

    (clear green)
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear red)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on blue purple)
      (on red orange)
      (on orange green)
    )
  )
)