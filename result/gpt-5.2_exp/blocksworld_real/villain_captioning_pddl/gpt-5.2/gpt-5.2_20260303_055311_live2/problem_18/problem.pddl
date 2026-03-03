(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red_block blue_block yellow_block orange_block purple_block green_block - block
    robot1 - robot
  )
  (:init
    ;; stacks in the scene
    (on purple_block red_block)
    (on yellow_block orange_block)
    (on orange_block blue_block)

    ;; blocks on the table
    (ontable red_block)
    (ontable blue_block)
    (ontable green_block)

    ;; clear blocks
    (clear purple_block)
    (clear yellow_block)
    (clear green_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green_block purple_block)
      (on purple_block orange_block)
      (on orange_block yellow_block)
      (on yellow_block blue_block)
      (on blue_block red_block)
    )
  )
)