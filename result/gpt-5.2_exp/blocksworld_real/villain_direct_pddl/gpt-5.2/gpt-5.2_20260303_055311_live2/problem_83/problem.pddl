(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; current configuration from the image:
    (ontable purple)
    (on red purple)
    (on yellow red)
    (on blue yellow)
    (on green blue)
    (ontable orange)

    (clear green)
    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      (ontable green)
      (on yellow green)
      (on orange yellow)
      (on blue orange)
      (on red blue)
      (on purple red)
    )
  )
)