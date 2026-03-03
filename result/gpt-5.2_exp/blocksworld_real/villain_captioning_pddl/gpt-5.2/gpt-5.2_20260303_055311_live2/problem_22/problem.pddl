(define (problem blocksworld_scene_stacks_2)
  (:domain blocksworld)

  (:objects
    orange red blue green purple - block
    robot1 - robot
  )

  (:init
    ;; existing single stack (top -> bottom): orange on red on blue on green on purple
    (on orange red)
    (on red blue)
    (on blue green)
    (on green purple)
    (ontable purple)

    ;; clear facts
    (clear orange)

    ;; robot state
    (handempty robot1)
  )

  ;; Note: The instruction requests a yellow block, but no yellow block exists in the scene.
  ;; Therefore, we encode the achievable portion with the available blocks.
  (:goal
    (and
      ;; stack 1: green over orange
      (on green orange)

      ;; stack 2 (partial, without yellow): purple over red over blue
      (on red blue)
      (on purple red)
    )
  )
)