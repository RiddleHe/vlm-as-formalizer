(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    pink purple blue red - block
    robot1 - robot
  )
  (:init
    (on pink purple)
    (on purple blue)
    (ontable blue)
    (ontable red)
    (clear pink)
    (clear red)
    (handempty robot1)
  )
  (:goal
    (and
      (on red blue)
      (on blue purple)
      (on purple pink)
    )
  )
)