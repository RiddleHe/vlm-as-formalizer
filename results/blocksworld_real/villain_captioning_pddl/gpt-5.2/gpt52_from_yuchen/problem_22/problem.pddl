(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    orange red blue green purple - block
    robot1 - robot
  )
  (:init
    ;; initial tower (bottom to top): purple, green, blue, red, orange
    (ontable purple)
    (on green purple)
    (on blue green)
    (on red blue)
    (on orange red)

    ;; clear/hand state
    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: green over orange
      (on green orange)

      ;; Stack 2 requested: purple over yellow over red over blue
      ;; Note: no yellow block exists in the provided scene, so we encode the achievable part with existing blocks.
      (on red blue)
    )
  )
)