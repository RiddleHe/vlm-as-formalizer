(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange1 green1 red1 purple1 yellow1 blue1 - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (top to bottom):
    (on orange1 green1)
    (on green1 red1)
    (on red1 purple1)
    (on purple1 yellow1)
    (on yellow1 blue1)

    ;; table support
    (ontable blue1)

    ;; clear facts
    (clear orange1)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; requested stack: blue over orange over green over purple over yellow over red
      ;; interpreted as bottom -> top: blue, orange, green, purple, yellow, red
      (ontable blue1)
      (on orange1 blue1)
      (on green1 orange1)
      (on purple1 green1)
      (on yellow1 purple1)
      (on red1 yellow1)
    )
  )
)