(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple orange yellow red green - block
    robot1 - robot
  )
  (:init
    (handempty robot1)

    (ontable blue)
    (clear blue)

    (ontable purple)
    (on orange purple)
    (on yellow orange)
    (on red yellow)
    (on green red)
    (clear green)
  )
  (:goal
    (and
      (on blue purple)
      (on purple green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (ontable orange)
    )
  )
)