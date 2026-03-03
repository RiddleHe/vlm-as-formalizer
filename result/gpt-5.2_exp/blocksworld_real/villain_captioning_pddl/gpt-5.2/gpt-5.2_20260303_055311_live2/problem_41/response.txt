(define (problem blocksworld-stacks-3)
  (:domain blocksworld)
  (:objects
    purple green red yellow orange blue - block
    robot1 - robot
  )
  (:init
    ;; Tall stack: purple on green on red on yellow (yellow on table)
    (on purple green)
    (on green red)
    (on red yellow)
    (ontable yellow)
    (clear purple)

    ;; Short stack: orange on blue (blue on table)
    (on orange blue)
    (ontable blue)
    (clear orange)

    ;; Robot state
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