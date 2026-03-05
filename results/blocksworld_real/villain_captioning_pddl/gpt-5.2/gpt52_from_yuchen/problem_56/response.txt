(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; Stack A
    (on yellow red)
    (ontable red)
    (clear yellow)

    ;; Stack B
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; Single blocks
    (ontable green)
    (clear green)
    (ontable purple)
    (clear purple)

    ;; Robot state
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