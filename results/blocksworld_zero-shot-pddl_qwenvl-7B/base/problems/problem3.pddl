(define (problem blocksworld)
  (:domain blocksworld)
  (:objects
    yellow-green - block
    green - block
    pink - block
    red - block
    purple - block
    robot - robot
  )
  (:init
    (clear yellow-green)
    (clear green)
    (clear pink)
    (clear red)
    (clear purple)
    (ontable yellow-green)
    (ontable green)
    (ontable pink)
    (ontable red)
    (ontable purple)
    (handempty robot)
  )
  (:goal
    (and
      (on yellow-green green)
      (on green pink)
      (on red purple)
    )
  )
)