(define (problem blocksworld_stack_4blocks)
  (:domain blocksworld)
  (:objects
    green yellow pink red - block
    robot1 - robot
  )
  (:init
    (ontable green)
    (ontable yellow)
    (ontable pink)
    (ontable red)
    (clear green)
    (clear yellow)
    (clear pink)
    (clear red)
    (handempty robot1)
  )
  (:goal
    (and
      (ontable green)
      (on yellow green)
      (on red yellow)
      (on pink red)
    )
  )
)