(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block_top_of_center_stack - block
    blue_block_middle_of_center_stack - block
    green_block_bottom_of_center_stack - block
    orange_block_single_left_front - block
    red_block_bottom_right_stack - block
    yellow_block_top_right_stack - block
    robot_arm - robot
  )

  (:init
    ;; table placements
    (ontable green_block_bottom_of_center_stack)
    (ontable orange_block_single_left_front)
    (ontable red_block_bottom_right_stack)

    ;; stacks present
    (on blue_block_middle_of_center_stack green_block_bottom_of_center_stack)
    (on purple_block_top_of_center_stack blue_block_middle_of_center_stack)
    (on yellow_block_top_right_stack red_block_bottom_right_stack)

    ;; clear blocks
    (clear purple_block_top_of_center_stack)
    (clear orange_block_single_left_front)
    (clear yellow_block_top_right_stack)

    ;; robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      (on blue_block_middle_of_center_stack orange_block_single_left_front)
      (on orange_block_single_left_front green_block_bottom_of_center_stack)
      (on green_block_bottom_of_center_stack purple_block_top_of_center_stack)
      (on purple_block_top_of_center_stack red_block_bottom_right_stack)
      (on red_block_bottom_right_stack yellow_block_top_right_stack)
    )
  )
)