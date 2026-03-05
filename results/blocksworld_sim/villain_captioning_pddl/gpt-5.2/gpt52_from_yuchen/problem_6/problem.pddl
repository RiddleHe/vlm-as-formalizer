(define (problem blocksworld_scene1_two_stacks)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    purple_block pink_block yellow_block orange_block red_block - block
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack: purple on pink on yellow (yellow on table)
    (on purple_block pink_block)
    (on pink_block yellow_block)
    (ontable yellow_block)
    (clear purple_block)

    ;; right stack: orange on red (red on table)
    (on orange_block red_block)
    (ontable red_block)
    (clear orange_block)
  )
  (:goal
    (and
      (on pink_block purple_block)
      (on yellow_block orange_block)
    )
  )
)