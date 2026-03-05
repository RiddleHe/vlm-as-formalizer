(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red_block green_block yellow_block blue_block orange_block purple_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1: red on green on yellow (yellow on table)
    (on red_block green_block)
    (on green_block yellow_block)
    (ontable yellow_block)
    (clear red_block)

    ;; stack 2: blue on orange (orange on table)
    (on blue_block orange_block)
    (ontable orange_block)
    (clear blue_block)

    ;; single block: purple on table
    (ontable purple_block)
    (clear purple_block)
  )
  (:goal
    (and
      ;; stack A: red over yellow over orange over blue
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block blue_block)

      ;; stack B: green over purple
      (on green_block purple_block)
    )
  )
)