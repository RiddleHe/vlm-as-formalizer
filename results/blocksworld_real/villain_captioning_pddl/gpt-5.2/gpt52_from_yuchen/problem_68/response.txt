(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange purple yellow green - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene
    (on red blue)
    (on blue orange)
    (ontable orange)

    ;; other blocks on the table
    (ontable purple)
    (ontable yellow)
    (ontable green)

    ;; clear blocks
    (clear red)
    (clear purple)
    (clear yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange red)
      (on red green)
      (on green blue)
      (on blue purple)
      (on purple yellow)
      (ontable yellow)
    )
  )
)