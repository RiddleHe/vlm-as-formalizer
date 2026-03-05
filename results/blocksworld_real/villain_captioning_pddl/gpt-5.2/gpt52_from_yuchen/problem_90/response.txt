(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue_block yellow_block orange_block green_block red_block purple_block - block
    robot1 - robot
  )
  (:init
    ;; stack from top to bottom: blue, yellow, orange, green, red, purple
    (on blue_block yellow_block)
    (on yellow_block orange_block)
    (on orange_block green_block)
    (on green_block red_block)
    (on red_block purple_block)
    (ontable purple_block)

    (clear blue_block)

    (handempty robot1)
  )
  (:goal
    (and
      (on red_block blue_block)
      (on orange_block yellow_block)
      (on purple_block green_block)
    )
  )
)