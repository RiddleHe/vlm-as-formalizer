(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red orange blue yellow green purple - block
    robot1 - robot
  )
  (:init
    ;; left stack: yellow on green on purple (purple on table)
    (ontable purple)
    (on green purple)
    (on yellow green)
    (clear yellow)

    ;; right stack: red on orange on blue (blue on table)
    (ontable blue)
    (on orange blue)
    (on red orange)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange (orange is bottom)
      (on yellow orange)
      (on red yellow)

      ;; stack 2: green over blue over purple (purple is bottom)
      (on blue purple)
      (on green blue)
    )
  )
)