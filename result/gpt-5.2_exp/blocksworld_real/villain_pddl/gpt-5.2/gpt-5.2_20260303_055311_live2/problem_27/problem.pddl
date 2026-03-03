(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red yellow orange purple - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block locations from the scene
    (ontable orange)
    (ontable green)
    (ontable purple)
    (ontable red)
    (ontable blue)

    ;; One stack already present: yellow on blue
    (on yellow blue)

    ;; Clear conditions
    (clear orange)
    (clear green)
    (clear purple)
    (clear red)
    (clear yellow)
  )

  (:goal
    (and
      (on blue green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)