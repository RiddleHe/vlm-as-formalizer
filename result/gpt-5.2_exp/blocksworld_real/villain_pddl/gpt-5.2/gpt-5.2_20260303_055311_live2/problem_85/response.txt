(define (problem blocksworld_color_stack)
  (:domain blocksworld)
  (:objects
    green orange purple red blue yellow - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single stack (top -> bottom):
    ;; green on orange on purple on red on blue on yellow (yellow on table)
    (on green orange)
    (on orange purple)
    (on purple red)
    (on red blue)
    (on blue yellow)
    (ontable yellow)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      (on red orange)
      (on orange yellow)
      (on yellow blue)
      (on blue green)
      (on green purple)
      (ontable purple)
    )
  )
)