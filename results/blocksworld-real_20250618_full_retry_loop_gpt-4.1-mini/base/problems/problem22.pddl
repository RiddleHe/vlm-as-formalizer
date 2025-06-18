(define (problem blocksworld-problem1)
  (:domain blocksworld)
  (:objects 
    orange red blue green purple yellow - block
    robot1 - robot
  )
  (:init
    ; Initial clear states from analysis 
    (clear orange)
    (clear green)
    (clear purple)
    (clear yellow)
    (clear red)
    ; blue is not clear (red on blue)
    
    ; On relationships initial
    (ontable orange)
    (ontable green)
    (ontable yellow)
    (on red blue)
    (on purple yellow)
    (ontable blue)
    
    (handempty robot1)
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