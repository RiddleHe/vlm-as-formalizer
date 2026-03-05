(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; stacked blocks in the scene
    (on yellow red)
    (on orange blue)

    ;; blocks on the table
    (ontable red)
    (ontable blue)
    (ontable green)
    (ontable purple)

    ;; clear blocks (nothing on top)
    (clear yellow)
    (clear orange)
    (clear green)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green blue)
      (on orange red)
      (on yellow purple)
    )
  )
)