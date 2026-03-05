(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block state from the scene
    (ontable green)
    (on blue green)
    (clear blue)

    (ontable red)
    (clear red)

    (ontable yellow)
    (clear yellow)

    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: blue over orange (note: no orange block exists in the scene)
      (on blue orange)

      ;; Stack 2: yellow over green over red over purple
      (on yellow green)
      (on green red)
      (on red purple)
    )
  )
)