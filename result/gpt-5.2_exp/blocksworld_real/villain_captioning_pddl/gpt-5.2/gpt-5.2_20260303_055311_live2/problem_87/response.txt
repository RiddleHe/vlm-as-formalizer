(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block yellow_block green_block blue_block orange_block red_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; tall stack (bottom to top): blue, green, yellow, purple
    (ontable blue_block)
    (on green_block blue_block)
    (on yellow_block green_block)
    (on purple_block yellow_block)

    ;; small stack (bottom to top): red, orange
    (ontable red_block)
    (on orange_block red_block)

    ;; clear facts (only top blocks of stacks are clear)
    (clear purple_block)
    (clear orange_block)
  )
  (:goal
    (and
      (on green_block red_block)
      (on purple_block blue_block)
      (on yellow_block orange_block)
    )
  )
)