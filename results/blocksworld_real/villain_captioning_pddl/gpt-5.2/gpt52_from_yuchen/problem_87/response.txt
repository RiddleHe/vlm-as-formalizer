(define (problem blocksworld_scene_stacks3)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    blue_block green_block yellow_block purple_block red_block orange_block - block
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; Stack A (bottom -> top): blue, green, yellow, purple
    (ontable blue_block)
    (on green_block blue_block)
    (on yellow_block green_block)
    (on purple_block yellow_block)

    ;; Stack B (bottom -> top): red, orange
    (ontable red_block)
    (on orange_block red_block)

    ;; clear blocks (tops of stacks)
    (clear purple_block)
    (clear orange_block)
  )
  (:goal
    (and
      ;; Create 3 stacks as instructed
      (on green_block red_block)
      (on purple_block blue_block)
      (on yellow_block orange_block)
    )
  )
)