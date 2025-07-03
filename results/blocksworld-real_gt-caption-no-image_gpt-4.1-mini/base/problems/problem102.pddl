(define (problem blocks_problem)
  (:domain blocksworld)
  (:objects
      robot1 - robot
      green red blue yellow purple orange - block
  )
  (:init
      (handempty robot1)
      (ontable orange)
      (on purple orange)
      (on yellow purple)
      (on blue yellow)
      (on red blue)
      (on green red)
      (clear green)
  )
  (:goal (and
      (on green red)
      (on red orange)
      (on orange blue)
      (on blue purple)
      (on purple yellow)
      (ontable yellow)
      (clear green)
      (handempty robot1)
  ))
)