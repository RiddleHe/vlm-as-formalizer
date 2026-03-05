(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    orange - block
    blue - block
    yellow - block
    red - block
    green - block
    purple - block
  )
  (:init
    ;; left stack: orange on blue (blue on table)
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; right stack (bottom to top): yellow, red, green, purple
    (on red yellow)
    (on green red)
    (on purple green)
    (ontable yellow)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on green blue)
      (on yellow red)
    )
  )
)