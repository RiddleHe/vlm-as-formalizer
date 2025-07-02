(define (problem stack_blocks)
  (:domain blocksworld)
  (:objects
    green_block - block
    orange_block - block
    purple_block - block
    yellow_block - block
    blue_block - block
    red_block - block
    robot1 - robot
  )
  (:init
    ; Initial stack: blue on red, red on yellow, yellow on purple
    (on blue_block red_block)
    (on red_block yellow_block)
    (on yellow_block purple_block)
    (clear blue_block)
    (clear red_block)
    (clear yellow_block)
    (clear purple_block)
    ; Second stack: green on orange
    (on green_block orange_block)
    (clear green_block)
    (clear orange_block)
    ; Robot is empty-handed
    (handempty robot1)
  )
  (:goal
    (and
      ; Stack 1: green over orange
      (on green_block orange_block)
      (on orange_block purple_block)
      (clear green_block)
      ; Stack 2: purple over yellow over red over blue
      (on purple_block yellow_block)
      (on yellow_block red_block)
      (on red_block blue_block)
      (clear purple_block)
      (clear yellow_block)
      (clear red_block)
      (clear blue_block)
    )
  )
)