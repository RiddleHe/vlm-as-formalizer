(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_single_block - block
    green_top_block - block
    orange_bottom_block - block
    red_top_of_tall_stack - block
    yellow_middle_of_tall_stack - block
    purple_bottom_of_tall_stack - block
    robot_arm - robot
  )

  (:init
    ;; Table placements
    (ontable blue_single_block)
    (ontable orange_bottom_block)
    (ontable purple_bottom_of_tall_stack)

    ;; Stacks in the scene
    (on green_top_block orange_bottom_block)
    (on yellow_middle_of_tall_stack purple_bottom_of_tall_stack)
    (on red_top_of_tall_stack yellow_middle_of_tall_stack)

    ;; Clear blocks
    (clear blue_single_block)
    (clear green_top_block)
    (clear red_top_of_tall_stack)

    ;; Robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      (on orange_bottom_block yellow_middle_of_tall_stack)
      (on yellow_middle_of_tall_stack purple_bottom_of_tall_stack)
      (on purple_bottom_of_tall_stack red_top_of_tall_stack)
      (on red_top_of_tall_stack blue_single_block)
      (on blue_single_block green_top_block)
    )
  )
)