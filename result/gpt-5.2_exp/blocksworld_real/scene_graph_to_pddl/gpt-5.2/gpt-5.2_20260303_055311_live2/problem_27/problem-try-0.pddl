(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    orange_block_front_left
    green_block_mid_left
    purple_block_front_center
    blue_block_mid_center_base
    yellow_block_mid_center_top
    red_block_back_right
    - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block_front_left)
    (ontable green_block_mid_left)
    (ontable purple_block_front_center)
    (ontable blue_block_mid_center_base)
    (ontable red_block_back_right)

    (on yellow_block_mid_center_top blue_block_mid_center_base)

    (clear orange_block_front_left)
    (clear green_block_mid_left)
    (clear purple_block_front_center)
    (clear yellow_block_mid_center_top)
    (clear red_block_back_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block_mid_center_base green_block_mid_left)
      (on green_block_mid_left red_block_back_right)
      (on red_block_back_right yellow_block_mid_center_top)
      (on yellow_block_mid_center_top orange_block_front_left)
      (on orange_block_front_left purple_block_front_center)
    )
  )
)