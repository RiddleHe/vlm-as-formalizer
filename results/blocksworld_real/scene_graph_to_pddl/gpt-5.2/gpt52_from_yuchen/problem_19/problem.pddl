(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_block_center - block
    yellow_block_left - block
    green_block_right_front - block
    blue_block_on_green - block
    purple_block_back_right - block
    robot_arm - robot
  )
  (:init
    (ontable orange_block_center)
    (ontable yellow_block_left)
    (ontable green_block_right_front)
    (ontable purple_block_back_right)

    (on blue_block_on_green green_block_right_front)

    (clear orange_block_center)
    (clear yellow_block_left)
    (clear blue_block_on_green)
    (clear purple_block_back_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block_on_green orange_block_center)
      (on yellow_block_left green_block_right_front)
      (on green_block_right_front red_over_purple_dummy)
    )
  )
)