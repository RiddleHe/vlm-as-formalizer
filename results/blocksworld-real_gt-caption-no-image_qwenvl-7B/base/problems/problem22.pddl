(define (problem blocksworld_stack)
  (:domain blocksworld)
  (:objects
    orange - block
    red - block
    blue - block
    green - block
    purple - block
    yellow - block
    robot1 - robot
  )
  (:init
    (clear orange)
    (clear red)
    (clear blue)
    (clear green)
    (clear purple)
    (clear yellow)
    (ontable orange)
    (ontable red)
    (ontable blue)
    (ontable green)
    (ontable purple)
    (ontable yellow)
    (handempty robot1)
    (on orange red)
    (on red blue)
    (on blue green)
    (on green purple)
    (on purple yellow)
  )
  (:goal
    (and
      (on green orange)
      (on purple yellow)
      (on yellow red)
      (on red blue)
    )
  )
)