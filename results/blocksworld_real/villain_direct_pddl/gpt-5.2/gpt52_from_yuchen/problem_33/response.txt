(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange purple yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions (from the scene)
    (on red blue)
    (ontable blue)

    (ontable orange)
    (ontable purple)
    (ontable yellow)
    (ontable green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear purple)
    (clear yellow)
    (clear green)
  )
  (:goal
    (and
      (on blue orange)
      (on orange purple)
      (on purple yellow)
      (on yellow green)
      (on green red)
    )
  )
)