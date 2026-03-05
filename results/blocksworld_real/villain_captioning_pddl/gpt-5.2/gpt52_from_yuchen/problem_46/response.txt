(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    red_block yellow_block orange_block purple_block blue_block green_block - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Table/base
    (ontable green_block)

    ;; Current stack (bottom -> top)
    (on blue_block green_block)
    (on purple_block blue_block)
    (on orange_block purple_block)
    (on yellow_block orange_block)
    (on red_block yellow_block)

    ;; Clear
    (clear red_block)
  )
  (:goal
    (and
      ;; Create 3 stacks:
      (on yellow_block green_block)
      (on blue_block purple_block)
      (on orange_block red_block)
    )
  )
)