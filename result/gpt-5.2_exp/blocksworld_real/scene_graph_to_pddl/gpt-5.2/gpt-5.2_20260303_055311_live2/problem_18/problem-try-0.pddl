(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block orange_block_left green_block yellow_block orange_block_right blue_block - block
    robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable orange_block_left)
    (ontable green_block)
    (ontable blue_block)

    ;; stacking relations
    (on purple_block orange_block_left)
    (on orange_block_right blue_block)
    (on yellow_block orange_block_right)

    ;; clear blocks
    (clear purple_block)
    (clear green_block)
    (clear yellow_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block purple_block)
      (on purple_block orange_block_left)
      (on orange_block_left yellow_block)
      (on yellow_block blue_block)
      (on blue_block red_block)
    )
  )
)