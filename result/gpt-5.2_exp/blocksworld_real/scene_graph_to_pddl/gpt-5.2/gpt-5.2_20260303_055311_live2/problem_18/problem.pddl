(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block orange_block_left green_block yellow_block orange_block_right blue_block - block
    robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable orange_block_left)
    (ontable green_block)
    (ontable blue_block)

    ;; stacks
    (on purple_block orange_block_left)
    (on yellow_block orange_block_right)
    (on orange_block_right blue_block)

    ;; clear blocks
    (clear purple_block)
    (clear green_block)
    (clear yellow_block)

    ;; robot state (as provided by scene graph)
    (handempty robot_arm)
    (handfull robot_arm)
    (holding purple_block)
  )
  (:goal
    (and
      (on green_block purple_block)
      (on purple_block orange_block_left)
      (on orange_block_left yellow_block)
      (on yellow_block blue_block)
      (on blue_block orange_block_right)
    )
  )
)