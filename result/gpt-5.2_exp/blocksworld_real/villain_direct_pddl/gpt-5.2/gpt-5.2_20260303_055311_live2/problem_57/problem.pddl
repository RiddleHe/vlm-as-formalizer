(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red orange blue yellow green purple - block
    robot1 - robot
  )
  (:init
    ;; left stack (as seen): yellow on green on purple
    (on yellow green)
    (on green purple)
    (ontable purple)
    (clear yellow)

    ;; right stack (as seen): red on orange on blue
    (on red orange)
    (on orange blue)
    (ontable blue)
    (clear red)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack 1: red over yellow over orange
      (on red yellow)
      (on yellow orange)

      ;; goal stack 2: green over blue over purple
      (on green blue)
      (on blue purple)
    )
  )
)