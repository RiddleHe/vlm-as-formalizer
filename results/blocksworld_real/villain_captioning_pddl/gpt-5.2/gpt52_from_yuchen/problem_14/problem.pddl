(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block blue_block orange_block red_block green_block - block
    robot1 - robot
  )
  (:init
    ;; Stack A: orange on red on green (green on table)
    (on orange_block red_block)
    (on red_block green_block)
    (ontable green_block)
    (clear orange_block)

    ;; Stack B: purple on yellow on blue (blue on table)
    (on purple_block yellow_block)
    (on yellow_block blue_block)
    (ontable blue_block)
    (clear purple_block)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: purple over yellow over orange
      (on purple_block yellow_block)
      (on yellow_block orange_block)

      ;; Stack 2: blue over red over green
      (on blue_block red_block)
      (on red_block green_block)
    )
  )
)