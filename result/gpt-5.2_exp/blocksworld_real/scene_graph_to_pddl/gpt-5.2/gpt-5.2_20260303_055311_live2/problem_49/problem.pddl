(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block_top_left_stack - block
    blue_block_middle_left_stack - block
    red_block_bottom_left_stack - block
    green_block_center - block
    orange_block_top_right_stack - block
    yellow_block_bottom_right_stack - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_bottom_left_stack)
    (ontable green_block_center)
    (ontable yellow_block_bottom_right_stack)

    (on purple_block_top_left_stack blue_block_middle_left_stack)
    (on blue_block_middle_left_stack red_block_bottom_left_stack)
    (on orange_block_top_right_stack yellow_block_bottom_right_stack)

    (clear purple_block_top_left_stack)
    (clear green_block_center)
    (clear orange_block_top_right_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block_bottom_left_stack yellow_block_bottom_right_stack)
      (on yellow_block_bottom_right_stack orange_block_top_right_stack)
      (on orange_block_top_right_stack green_block_center)
      (on green_block_center purple_block_top_left_stack)
      (on purple_block_top_left_stack blue_block_middle_left_stack)
    )
  )
)