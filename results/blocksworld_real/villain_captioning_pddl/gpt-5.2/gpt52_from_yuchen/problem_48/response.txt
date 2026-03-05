(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow green purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (on red yellow)
    (on yellow green)
    (ontable green)
    (clear red)

    ;; right stack
    (on purple blue)
    (on blue orange)
    (ontable orange)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue purple)
      (on red yellow)
      (on green orange)
    )
  )
)