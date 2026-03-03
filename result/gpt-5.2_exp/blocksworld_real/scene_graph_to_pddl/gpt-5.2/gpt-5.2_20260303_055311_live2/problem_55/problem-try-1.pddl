(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_left orange_block_front_left green_block_front_center
    blue_block_back_center yellow_block_back_right purple_block_front_right - block
    single_robot_arm - robot
  )
  (:init
    (ontable red_block_left)
    (ontable orange_block_front_left)
    (ontable green_block_front_center)
    (ontable blue_block_back_center)
    (ontable yellow_block_back_right)
    (ontable purple_block_front_right)

    (clear red_block_left)
    (clear orange_block_front_left)
    (clear green_block_front_center)
    (clear blue_block_back_center)
    (clear yellow_block_back_right)
    (clear purple_block_front_right)

    (handempty single_robot_arm)
  )
  (:goal
    (and
      (on orange_block_front_left red_block_left)
      (on green_block_front_center orange_block_front_left)
      (on purple_block_front_right yellow_block_back_right)
      (on blue_block_back_center purple_block_front_right)
    )
  )
)