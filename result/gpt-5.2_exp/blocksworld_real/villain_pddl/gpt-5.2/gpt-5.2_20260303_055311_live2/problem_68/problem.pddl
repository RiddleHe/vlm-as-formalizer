(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red blue green purple yellow - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks and table placements from the image
    (on red blue)
    (on blue orange)
    (ontable orange)
    (clear red)

    (ontable purple)
    (clear purple)

    (ontable yellow)
    (clear yellow)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      (on orange red)
      (on red green)
      (on green blue)
      (on blue purple)
      (on purple yellow)
      (ontable yellow)
      (clear orange)
    )
  )
)