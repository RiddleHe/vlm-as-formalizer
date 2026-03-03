(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange purple red yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current stacks from the image
    (ontable blue)
    (on orange blue)
    (on purple orange)
    (clear purple)

    (ontable yellow)
    (on red yellow)
    (clear red)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      (ontable yellow)
      (on blue yellow)
      (on purple blue)
      (on orange purple)
      (on red orange)
      (on green red)
      (clear green)
    )
  )
)