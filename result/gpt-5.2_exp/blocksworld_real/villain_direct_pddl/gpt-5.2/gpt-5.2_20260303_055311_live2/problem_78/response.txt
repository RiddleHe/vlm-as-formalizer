(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue purple yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene
    (ontable green)
    (ontable yellow)
    (ontable red)

    (ontable blue)
    (on orange blue)
    (on purple orange)

    (clear green)
    (clear yellow)
    (clear red)
    (clear purple)
  )
  (:goal
    (and
      (ontable purple)
      (on blue purple)
      (on green blue)

      (ontable red)
      (on orange red)
      (on yellow orange)
    )
  )
)