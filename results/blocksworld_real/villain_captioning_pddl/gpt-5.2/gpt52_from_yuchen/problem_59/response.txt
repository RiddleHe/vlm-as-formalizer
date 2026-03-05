(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow_block red_block orange_block purple_block green_block blue_block - block
    robot1 - robot
  )
  (:init
    ;; stack A: purple on orange
    (on purple_block orange_block)
    (ontable orange_block)
    (clear purple_block)

    ;; stack B: blue on green
    (on blue_block green_block)
    (ontable green_block)
    (clear blue_block)

    ;; single blocks on table
    (ontable yellow_block)
    (clear yellow_block)
    (ontable red_block)
    (clear red_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on orange_block purple_block)
      (on red_block green_block)
    )
  )
)