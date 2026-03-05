(define (problem blocksworld_scene_01)
  (:domain blocksworld)
  (:objects
    purple_block_top_left_stack - block
    pink_block_middle_left_stack - block
    yellow_block_bottom_left_stack - block
    orange_block_top_right_stack - block
    red_block_bottom_right_stack - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block_bottom_left_stack)
    (ontable red_block_bottom_right_stack)

    (on purple_block_top_left_stack pink_block_middle_left_stack)
    (on pink_block_middle_left_stack yellow_block_bottom_left_stack)
    (on orange_block_top_right_stack red_block_bottom_right_stack)

    (clear purple_block_top_left_stack)
    (clear orange_block_top_right_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on pink_block_middle_left_stack purple_block_top_left_stack)
      (on yellow_block_bottom_left_stack orange_block_top_right_stack)
    )
  )
)