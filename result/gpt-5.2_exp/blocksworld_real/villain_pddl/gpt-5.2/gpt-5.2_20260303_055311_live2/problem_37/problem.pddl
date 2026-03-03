(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single vertical stack on the table.
    (ontable red)
    (on purple red)
    (on orange purple)
    (on blue orange)
    (on yellow blue)
    (on green yellow)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      (ontable red)
      (on orange red)
      (on purple orange)
      (on yellow purple)
      (on blue yellow)
      (on green blue)
    )
  )
)