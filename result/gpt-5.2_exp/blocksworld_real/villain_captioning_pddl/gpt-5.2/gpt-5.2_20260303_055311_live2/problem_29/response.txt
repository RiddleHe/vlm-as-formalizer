(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_block orange_block green_block purple_block red_block yellow_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack: orange on green on red (red on table)
    (on orange_block green_block)
    (on green_block red_block)
    (ontable red_block)

    ;; other blocks on table
    (ontable blue_block)
    (ontable yellow_block)
    (ontable purple_block)

    ;; clear blocks
    (clear orange_block)
    (clear blue_block)
    (clear yellow_block)
    (clear purple_block)
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on orange_block green_block)
      (on green_block purple_block)
      (on purple_block red_block)
      (on red_block yellow_block)
      (ontable yellow_block)
    )
  )
)