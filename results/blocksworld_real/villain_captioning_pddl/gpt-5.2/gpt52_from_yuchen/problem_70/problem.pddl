(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green_block blue_block orange_block yellow_block purple_block red_block - block
    robot1 - robot
  )
  (:init
    ;; stack (bottom -> top): purple, yellow, blue, green, orange
    (ontable purple_block)
    (on yellow_block purple_block)
    (on blue_block yellow_block)
    (on green_block blue_block)
    (on orange_block green_block)

    ;; separate block
    (ontable red_block)

    ;; clear blocks
    (clear orange_block)
    (clear red_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow_block red_block)
      (on red_block orange_block)
      (on orange_block blue_block)
      (on blue_block purple_block)
      (on purple_block green_block)
    )
  )
)