(define (problem blocksworld_two_stacks_scene)
  (:domain blocksworld)

  (:objects
    blue_block orange_block green_block purple_block yellow_block red_block - block
    robot1 - robot
  )

  (:init
    ;; main stack (bottom -> top): yellow, purple, green, orange, blue
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
      ;; Stack 1: orange over purple over blue  (top -> bottom)
      (on orange_block purple_block)
      (on purple_block blue_block)

      ;; Stack 2: yellow over red over green (top -> bottom)
      (on yellow_block red_block)
      (on red_block green_block)
    )
  )
)