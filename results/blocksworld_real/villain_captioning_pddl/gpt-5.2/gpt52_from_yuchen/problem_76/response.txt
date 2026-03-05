(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red_block blue_block green_block purple_block yellow_block orange_block - block
    robot1 - robot
  )
  (:init
    ;; stack from bottom to top: red, blue, green, purple, yellow, orange
    (ontable red_block)
    (on blue_block red_block)
    (on green_block blue_block)
    (on purple_block green_block)
    (on yellow_block purple_block)
    (on orange_block yellow_block)

    (clear orange_block)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: red over purple
      (on red_block purple_block)

      ;; Stack 2: yellow over green over orange over blue
      (on yellow_block green_block)
      (on green_block orange_block)
      (on orange_block blue_block)
    )
  )
)