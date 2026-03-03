(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue_block - block
    green_block - block
    purple_block - block
    yellow_block - block
    orange_block_top - block
    orange_block_bottom - block
  )

  (:init
    ;; robot state
    (handempty robot1)

    ;; left-side single blocks
    (ontable purple_block)
    (clear purple_block)

    (ontable yellow_block)
    (clear yellow_block)

    ;; blue block on table
    (ontable blue_block)
    (clear blue_block)

    ;; right-side stack: green on orange_block_top on orange_block_bottom
    (ontable orange_block_bottom)
    (on orange_block_top orange_block_bottom)
    (on green_block orange_block_top)
    (clear green_block)
  )

  ;; Instruction: Create 3 stacks: blue over orange, purple over green, yellow over red
  ;; Note: no distinct red block is present; using the available bottom orange-toned block
  ;; as the "red" block in the goal.
  (:goal
    (and
      (on blue_block orange_block_top)
      (on purple_block green_block)
      (on yellow_block orange_block_bottom)
    )
  )
)