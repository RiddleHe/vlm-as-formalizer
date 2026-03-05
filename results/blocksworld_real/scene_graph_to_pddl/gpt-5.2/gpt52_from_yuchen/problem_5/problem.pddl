(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    red_block yellow_block orange_block purple_block blue_block green_block - block
    robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable yellow_block)
    (ontable orange_block)
    (ontable purple_block)
    (ontable blue_block)
    (ontable green_block)

    ;; stacking relation in the scene
    (on red_block yellow_block)

    ;; clear blocks (nothing on top)
    (clear red_block)
    (clear orange_block)
    (clear purple_block)
    (clear blue_block)
    (clear green_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block purple_block)
      (on blue_block red_block)
      (on orange_block green_block)
    )
  )
)