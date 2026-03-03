(define (problem blocksworld_scene_stacks)
  (:domain blocksworld)
  (:objects
    blue_block green_block red_block orange_block purple_block yellow_block - block
    robot_arm - robot
  )
  (:init
    ;; current stacks
    (on green_block red_block)
    (on red_block orange_block)

    ;; blocks on table
    (ontable orange_block)
    (ontable blue_block)
    (ontable purple_block)
    (ontable yellow_block)

    ;; clear blocks
    (clear green_block)
    (clear blue_block)
    (clear purple_block)
    (clear yellow_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block orange_block)
      (on purple_block green_block)
      (on yellow_block red_block)
    )
  )
)