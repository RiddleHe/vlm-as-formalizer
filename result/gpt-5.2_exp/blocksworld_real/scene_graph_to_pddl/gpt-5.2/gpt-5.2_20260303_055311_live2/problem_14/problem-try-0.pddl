(define (problem blocksworld_scene_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_top_block red_middle_block green_bottom_block
    purple_top_block yellow_middle_block blue_bottom_block - block
    robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable green_bottom_block)
    (ontable blue_bottom_block)

    ;; current stacks
    (on orange_top_block red_middle_block)
    (on red_middle_block green_bottom_block)
    (on purple_top_block yellow_middle_block)
    (on yellow_middle_block blue_bottom_block)

    ;; clear blocks
    (clear orange_top_block)
    (clear purple_top_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_top_block yellow_middle_block)
      (on yellow_middle_block orange_top_block)
      (on blue_bottom_block red_middle_block)
      (on red_middle_block green_bottom_block)
    )
  )
)