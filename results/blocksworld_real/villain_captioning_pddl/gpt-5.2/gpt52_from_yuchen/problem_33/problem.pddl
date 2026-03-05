(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    red blue orange yellow green purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on red blue)
    (ontable blue)
    (clear red)

    ;; single blocks on the table
    (ontable orange)
    (clear orange)
    (ontable yellow)
    (clear yellow)
    (ontable green)
    (clear green)
    (ontable purple)
    (clear purple)

    ;; blue has red on it
    (handempty robot1)
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