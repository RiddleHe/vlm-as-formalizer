(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple - block
    yellow - block
    blue - block
    green - block
    orange - block
    red - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (bottom -> top): purple, yellow, blue, green, orange
    (ontable purple)
    (on yellow purple)
    (on blue yellow)
    (on green blue)
    (on orange green)

    ;; red block is separate on the table
    (ontable red)

    ;; clear blocks
    (clear orange)
    (clear red)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack: yellow over red over orange over blue over purple over green
      (ontable green)
      (on purple green)
      (on blue purple)
      (on orange blue)
      (on red orange)
      (on yellow red)
    )
  )
)