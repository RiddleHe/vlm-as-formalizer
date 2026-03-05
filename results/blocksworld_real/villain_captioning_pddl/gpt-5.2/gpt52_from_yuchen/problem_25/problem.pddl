(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue_block purple_block orange_block red_block yellow_block green_block - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack A (left): blue on orange, orange on table
    (on blue_block orange_block)
    (ontable orange_block)
    (clear blue_block)

    ;; Stack B (right): yellow on red on green, green on table
    (on yellow_block red_block)
    (on red_block green_block)
    (ontable green_block)
    (clear yellow_block)

    ;; Single block: purple on table
    (ontable purple_block)
    (clear purple_block)
  )
  (:goal
    (and
      ;; Stack 1: orange over red over yellow
      (on orange_block red_block)
      (on red_block yellow_block)

      ;; Stack 2: blue over purple over green
      (on blue_block purple_block)
      (on purple_block green_block)
    )
  )
)