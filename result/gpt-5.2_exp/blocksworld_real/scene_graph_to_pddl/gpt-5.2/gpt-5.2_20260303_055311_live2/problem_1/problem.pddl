(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    green-wooden-cube blue-wooden-cube purple-wooden-cube orange-wooden-cube red-wooden-cube yellow-wooden-cube - block
    robot-arm - robot
  )
  (:init
    (ontable green-wooden-cube)
    (ontable blue-wooden-cube)
    (ontable purple-wooden-cube)
    (ontable red-wooden-cube)
    (ontable yellow-wooden-cube)

    (on orange-wooden-cube purple-wooden-cube)

    (clear green-wooden-cube)
    (clear blue-wooden-cube)
    (clear orange-wooden-cube)
    (clear red-wooden-cube)
    (clear yellow-wooden-cube)

    (handempty robot-arm)
  )
  (:goal
    (and
      (on orange-wooden-cube yellow-wooden-cube)
      (on green-wooden-cube blue-wooden-cube)
      (on red-wooden-cube purple-wooden-cube)
    )
  )
)