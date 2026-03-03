(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange yellow green purple red blue - block
    robot1 - robot
  )
  (:init
    ;; current scene (from visual analysis)
    (on green blue)
    (on blue orange)
    (ontable orange)

    (ontable yellow)
    (ontable red)
    (ontable purple)

    (clear green)
    (clear yellow)
    (clear red)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
    )
  )
)