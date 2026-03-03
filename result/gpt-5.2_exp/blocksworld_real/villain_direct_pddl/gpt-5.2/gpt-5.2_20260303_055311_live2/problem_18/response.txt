(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue yellow orange purple green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (from image)
    (on purple orange)
    (ontable orange)
    (clear purple)

    (ontable green)
    (clear green)

    (on yellow orange)     ;; right stack: yellow on orange
    (on orange blue)
    (ontable blue)
    (clear yellow)

    (ontable red)
    (clear red)
  )
  (:goal
    (and
      (on green purple)
      (on purple orange)
      (on orange yellow)
      (on yellow blue)
      (on blue red)
      (ontable red)
    )
  )
)