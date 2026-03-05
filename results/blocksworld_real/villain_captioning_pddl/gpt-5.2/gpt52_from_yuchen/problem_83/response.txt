(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )

  (:init
    ;; robot state
    (handempty robot1)

    ;; main stack (bottom to top): purple, red, yellow, blue, green
    (ontable purple)
    (on red purple)
    (on yellow red)
    (on blue yellow)
    (on green blue)

    ;; separate block
    (ontable orange)

    ;; clear blocks
    (clear green)
    (clear orange)
  )

  ;; Goal: 1 stack: purple over red over blue over orange over yellow over green
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