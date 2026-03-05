(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_block_left - block
    blue_block_front_center - block
    yellow_block_back_center - block
    orange_block_right_stack_top - block
    purple_block_right_stack_bottom - block
    red_block_front_right - block
    robot_arm - robot
  )
  (:init
    (ontable green_block_left)
    (ontable blue_block_front_center)
    (ontable yellow_block_back_center)
    (ontable purple_block_right_stack_bottom)
    (ontable red_block_front_right)

    (on orange_block_right_stack_top purple_block_right_stack_bottom)

    (clear green_block_left)
    (clear blue_block_front_center)
    (clear yellow_block_back_center)
    (clear orange_block_right_stack_top)
    (clear red_block_front_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block_left orange_block_right_stack_top)
      (on orange_block_right_stack_top blue_block_front_center)
      (on blue_block_front_center yellow_block_back_center)
      (on purple_block_right_stack_bottom red_block_front_right)
    )
  )
)