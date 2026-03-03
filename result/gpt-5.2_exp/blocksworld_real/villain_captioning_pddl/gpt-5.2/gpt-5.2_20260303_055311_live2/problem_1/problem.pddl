(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    green_block blue_block purple_block orange_block red_block yellow_block - block
    robot1 - robot
  )
  (:init
    ;; blocks on table
    (ontable green_block)
    (ontable blue_block)
    (ontable orange_block)
    (ontable red_block)
    (ontable yellow_block)

    ;; existing stack
    (on purple_block orange_block)

    ;; clear conditions
    (clear green_block)
    (clear blue_block)
    (clear purple_block)
    (clear red_block)
    (clear yellow_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange_block yellow_block)
      (on green_block blue_block)
      (on red_block purple_block)
    )
  )
)