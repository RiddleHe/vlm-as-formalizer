(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; Stack A: purple on blue on green
    (on purple blue)
    (on blue green)
    (ontable green)
    (clear purple)

    ;; Stack B: yellow on red
    (on yellow red)
    (ontable red)
    (clear yellow)

    ;; Single block
    (ontable orange)
    (clear orange)

    ;; Robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
    )
  )
)