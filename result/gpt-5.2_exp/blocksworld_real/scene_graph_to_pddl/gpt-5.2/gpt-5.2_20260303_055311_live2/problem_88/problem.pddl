(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block blue_block green_block purple_block red_block yellow_block - block
    robot - robot
  )
  (:init
    ;; table placements
    (ontable green_block)
    (ontable purple_block)
    (ontable yellow_block)

    ;; stacked relations
    (on orange_block blue_block)
    (on blue_block green_block)
    (on red_block yellow_block)

    ;; clear blocks
    (clear orange_block)
    (clear purple_block)
    (clear red_block)

    ;; robot state
    (handempty robot)
  )
  (:goal
    (and
      ;; stack 1: green over blue
      (on green_block blue_block)

      ;; stack 2: yellow over red over purple over orange
      (on yellow_block red_block)
      (on red_block purple_block)
      (on purple_block orange_block)
    )
  )
)