(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    blue_block orange_block green_block purple_block yellow_block red_block - block
    robot1 - robot
  )
  (:init
    ;; existing tower (bottom -> top): yellow, purple, green, orange, blue
    (ontable yellow_block)
    (on purple_block yellow_block)
    (on green_block purple_block)
    (on orange_block green_block)
    (on blue_block orange_block)

    ;; separate block
    (ontable red_block)

    ;; clear blocks
    (clear blue_block)
    (clear red_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: orange over purple over blue
      (on orange_block purple_block)
      (on purple_block blue_block)

      ;; Stack 2: yellow over red over green
      (on yellow_block red_block)
      (on red_block green_block)
    )
  )
)