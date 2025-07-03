(define (problem blocks_problem)
  (:domain blocksworld)
  (:objects
    yellow red orange blue green purple - block
    robot1 - robot
  )
  (:init
    (ontable green)
    (ontable yellow)
    (ontable red)
    (ontable purple)
    (on orange blue)
    (on blue green)
    (clear orange)
    (clear yellow)
    (clear red)
    (clear purple)
    (handempty robot1)
  )
  (:goal (and
    (on orange blue)
    (ontable blue)
    (on yellow green)
    (on green red)
    (on red purple)
    (ontable purple)
  ))
)