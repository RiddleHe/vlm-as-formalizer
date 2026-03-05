(define (problem blocksworld_stacks3)
  (:domain blocksworld)
  (:objects
    orange yellow blue red purple green - block
    robot1 - robot
  )
  (:init
    (ontable orange)
    (ontable yellow)
    (ontable blue)
    (ontable red)
    (ontable purple)
    (ontable green)

    (clear orange)
    (clear yellow)
    (clear blue)
    (clear red)
    (clear purple)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on blue red)
      (on purple green)
    )
  )
)