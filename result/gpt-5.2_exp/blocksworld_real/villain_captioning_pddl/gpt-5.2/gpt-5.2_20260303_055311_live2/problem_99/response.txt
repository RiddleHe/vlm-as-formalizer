(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    green red blue yellow purple orange - block
    robot1 - robot
  )
  (:init
    (ontable green)
    (ontable red)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable orange)

    (clear green)
    (clear red)
    (clear blue)
    (clear yellow)
    (clear purple)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on blue yellow)
      (on purple orange)
    )
  )
)