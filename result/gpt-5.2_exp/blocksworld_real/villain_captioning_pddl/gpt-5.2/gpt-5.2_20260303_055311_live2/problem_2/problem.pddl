(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    green_block yellow_block orange_block blue_block purple_block red_block - block
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack (bottom -> top): red, purple, blue, orange
    (ontable red_block)
    (on purple_block red_block)
    (on blue_block purple_block)
    (on orange_block blue_block)
    (clear orange_block)

    ;; right stack (bottom -> top): yellow, green
    (ontable yellow_block)
    (on green_block yellow_block)
    (clear green_block)
  )
  (:goal
    (and
      ;; one stack (bottom -> top): yellow, orange, blue, purple, red, green
      (ontable yellow_block)
      (on orange_block yellow_block)
      (on blue_block orange_block)
      (on purple_block blue_block)
      (on red_block purple_block)
      (on green_block red_block)
    )
  )
)