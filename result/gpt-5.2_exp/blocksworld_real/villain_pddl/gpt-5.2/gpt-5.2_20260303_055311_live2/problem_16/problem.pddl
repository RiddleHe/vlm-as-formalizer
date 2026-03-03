(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange purple red yellow green - block
    robot1 - robot
  )
  (:init
    ;; stacks and table placements from the image
    (on purple orange)
    (on orange blue)
    (ontable blue)
    (clear purple)

    (on red yellow)
    (ontable yellow)
    (clear red)

    (ontable green)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on red orange)
      (on orange purple)
      (on purple blue)
      (on blue yellow)
    )
  )
)