(define (problem blocksworld-stack1)
  (:domain blocksworld)
  (:objects
    green orange blue red yellow - block
    robot1 - robot
  )
  (:init
    ;; Current stack (bottom to top): yellow, red, blue, orange, green
    (ontable yellow)
    (on red yellow)
    (on blue red)
    (on orange blue)
    (on green orange)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack: yellow over red over blue over orange over green
      (on yellow red)
      (on red blue)
      (on blue orange)
      (on orange green)
    )
  )
)