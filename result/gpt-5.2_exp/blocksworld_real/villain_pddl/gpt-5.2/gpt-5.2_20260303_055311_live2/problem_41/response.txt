(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange purple green blue yellow red - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current scene (from image):
    ;; Left stack: orange on blue (blue on table)
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; Right stack (bottom to top): yellow, red, green, purple
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