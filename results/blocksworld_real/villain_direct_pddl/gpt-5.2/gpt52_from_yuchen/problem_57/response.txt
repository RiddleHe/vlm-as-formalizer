(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; left stack: yellow on green on purple (purple on table)
    (on yellow green)
    (on green purple)
    (ontable purple)
    (clear yellow)

    ;; right stack: red on orange on blue (blue on table)
    (on red orange)
    (on orange blue)
    (ontable blue)
    (clear red)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange (orange on table)
      (on red yellow)
      (on yellow orange)
      (ontable orange)
      (clear red)

      ;; stack 2: green over blue over purple (purple on table)
      (on green blue)
      (on blue purple)
      (ontable purple)
      (clear green)
    )
  )
)