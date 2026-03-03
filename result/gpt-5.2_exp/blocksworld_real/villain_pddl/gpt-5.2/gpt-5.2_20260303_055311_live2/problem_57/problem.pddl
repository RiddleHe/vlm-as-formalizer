(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red orange blue yellow green purple - block
    robot1 - robot
  )
  (:init
    ;; left stack in the image: yellow on green on purple
    (on yellow green)
    (on green purple)
    (ontable purple)
    (clear yellow)

    ;; right stack in the image: red on orange on blue
    (on red orange)
    (on orange blue)
    (ontable blue)
    (clear red)

    ;; robot initial condition
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange (with orange on table)
      (on red yellow)
      (on yellow orange)
      (ontable orange)

      ;; stack 2: green over blue over purple (with purple on table)
      (on green blue)
      (on blue purple)
      (ontable purple)
    )
  )
)