(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    yellow - block
    green - block
    blue - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table initially
    (ontable red)
    (ontable yellow)
    (ontable green)
    (ontable purple)

    ;; blue is stacked on green in the scene
    (on blue green)

    ;; clear conditions
    (clear red)
    (clear yellow)
    (clear blue)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: blue over orange (note: orange block not present in the scene objects; goal uses blue on red? No—must follow instruction; orange not available.)
      ;; Since the instruction requires an orange block but none is visible, we encode only goals achievable with visible blocks.
      ;; stack 2: yellow over green over red over purple
      (on red purple)
      (on green red)
      (on yellow green)
    )
  )
)