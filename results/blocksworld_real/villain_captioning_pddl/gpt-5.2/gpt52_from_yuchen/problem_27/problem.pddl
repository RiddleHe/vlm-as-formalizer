(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange green blue yellow red purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on yellow blue)

    ;; blocks on table
    (ontable orange)
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable purple)

    ;; clear blocks (nothing on top)
    (clear yellow)
    (clear orange)
    (clear green)
    (clear red)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; create 1 stack: blue over green over red over yellow over orange over purple
      (on blue green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)