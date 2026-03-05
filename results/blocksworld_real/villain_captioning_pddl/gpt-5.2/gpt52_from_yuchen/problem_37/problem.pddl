(define (problem blocksworld-colored-stack)
  (:domain blocksworld)
  (:objects
    green yellow blue orange purple red - block
    robot1 - robot
  )
  (:init
    ;; current stack (top to bottom): green on yellow on blue on orange on purple on red (on table)
    (on green yellow)
    (on yellow blue)
    (on blue orange)
    (on orange purple)
    (on purple red)
    (ontable red)

    ;; clear statuses
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack: green over blue over yellow over purple over orange over red
      (on green blue)
      (on blue yellow)
      (on yellow purple)
      (on purple orange)
      (on orange red)
      (ontable red)
    )
  )
)