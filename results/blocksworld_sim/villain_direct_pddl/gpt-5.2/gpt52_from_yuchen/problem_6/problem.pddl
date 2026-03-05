(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple_block - block
    pink_block - block
    yellow_block - block
    orange_block - block
    red_block - block
    robot1 - robot
  )
  (:init
    ;; left stack: purple on pink on yellow (yellow on table)
    (on purple_block pink_block)
    (on pink_block yellow_block)
    (ontable yellow_block)
    (clear purple_block)

    ;; right stack: orange on red (red on table)
    (on orange_block red_block)
    (ontable red_block)
    (clear orange_block)

    ;; blocks not supporting anything else
    (clear red_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on pink_block purple_block)
      (on yellow_block orange_block)
    )
  )
)