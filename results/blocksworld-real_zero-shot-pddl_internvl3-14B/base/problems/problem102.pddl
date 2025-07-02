(define (problem blocksworld-tower)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    green - block
    red - block
    orange - block
    blue - block
    purple - block
    yellow - block
  )
  (:init
    (ontable yellow)
    (clear red)
    (on red green)
    (clear orange)
    (on orange red)
    (clear blue)
    (on blue orange)
    (clear purple)
    (on purple blue)
    (clear green)
    (on green purple)
    (handempty robot1)
  )
  (:goal
    (and
      (ontable yellow)
      (on green red)
      (on red orange)
      (on orange blue)
      (on blue purple)
      (on purple green)
      (handempty robot1)
    )
  )
)