(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    blue_block_front_center - block
    orange_block_right_center - block
    green_block_left_center - block
    red_block_back_right - block
    yellow_block_back_left - block
    purple_block_back_center - block
    robot_arm_1 - robot
  )
  (:init
    (ontable blue_block_front_center)
    (ontable orange_block_right_center)
    (ontable green_block_left_center)
    (ontable red_block_back_right)
    (ontable yellow_block_back_left)
    (ontable purple_block_back_center)

    (clear blue_block_front_center)
    (clear orange_block_right_center)
    (clear green_block_left_center)
    (clear red_block_back_right)
    (clear yellow_block_back_left)
    (clear purple_block_back_center)

    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on blue_block_front_center orange_block_right_center)
      (on green_block_left_center red_block_back_right)
      (on yellow_block_back_left purple_block_back_center)
    )
  )
)