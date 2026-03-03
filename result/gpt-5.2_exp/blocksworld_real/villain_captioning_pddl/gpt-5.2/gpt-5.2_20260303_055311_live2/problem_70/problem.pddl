(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack on the left: orange over green over blue over yellow over purple
    (ontable purple)
    (on yellow purple)
    (on blue yellow)
    (on green blue)
    (on orange green)

    ;; separate block
    (ontable red)

    ;; clear blocks
    (clear orange)
    (clear red)
  )
  (:goal
    (and
      ;; create 1 stack: yellow over red over orange over blue over purple over green
      (ontable green)
      (on purple green)
      (on blue purple)
      (on orange blue)
      (on red orange)
      (on yellow red)
    )
  )
)