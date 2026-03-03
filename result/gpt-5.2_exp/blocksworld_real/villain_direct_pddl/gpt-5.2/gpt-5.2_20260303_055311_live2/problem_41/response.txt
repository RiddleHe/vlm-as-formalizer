(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue yellow red green purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; left small stack: orange on blue
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; right tall stack (bottom to top): yellow, red, green, purple
    (on red yellow)
    (on green red)
    (on purple green)
    (ontable yellow)
    (clear purple)
  )
  (:goal
    (and
      (on orange purple)
      (on green blue)
      (on yellow red)
    )
  )
)