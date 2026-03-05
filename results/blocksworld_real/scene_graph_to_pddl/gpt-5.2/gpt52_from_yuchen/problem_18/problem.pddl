(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block orange_block green_block yellow_block orange_block_right blue_block - block
    robot_arm - robot
  )
  (:init
    ;; robot state
    (handempty robot_arm)

    ;; table placements
    (ontable orange_block)
    (ontable green_block)
    (ontable blue_block)

    ;; stacking relations
    (on purple_block orange_block)
    (on orange_block_right blue_block)
    (on yellow_block orange_block_right)

    ;; clear blocks
    (clear purple_block)
    (clear green_block)
    (clear yellow_block)
  )
  (:goal
    (and
      (on green_block purple_block)
      (on purple_block orange_block)
      (on orange_block yellow_block)
      (on yellow_block blue_block)
      (on blue_block orange_block_right)
    )
  )
)