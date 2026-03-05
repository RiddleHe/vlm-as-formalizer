(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red_block blue_block purple_block green_block yellow_block orange_block - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (ontable red_block)
    (on blue_block red_block)
    (on purple_block blue_block)
    (clear purple_block)

    ;; middle single
    (ontable green_block)
    (clear green_block)

    ;; right stack
    (ontable yellow_block)
    (on orange_block yellow_block)
    (clear orange_block)

    ;; robot
    (handempty robot1)
  )
  (:goal
    (and
      (on red_block yellow_block)
      (on yellow_block orange_block)
      (on orange_block green_block)
      (on green_block purple_block)
      (on purple_block blue_block)
    )
  )
)