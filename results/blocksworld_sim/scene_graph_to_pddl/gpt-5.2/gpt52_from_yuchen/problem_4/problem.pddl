(define (problem blocksworld_stack_orange_yellow_blue_purple_red)
  (:domain blocksworld)
  (:objects
    orange_block_leftmost - block
    blue_block_second - block
    yellow_block_third - block
    purple_block_rightstack_upper - block
    red_block_rightstack_lower - block
    robot_arm_1 - robot
  )
  (:init
    (ontable orange_block_leftmost)
    (ontable blue_block_second)
    (ontable yellow_block_third)
    (ontable red_block_rightstack_lower)

    (on purple_block_rightstack_upper red_block_rightstack_lower)

    (clear orange_block_leftmost)
    (clear blue_block_second)
    (clear yellow_block_third)
    (clear purple_block_rightstack_upper)

    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on orange_block_leftmost yellow_block_third)
      (on yellow_block_third blue_block_second)
      (on blue_block_second purple_block_rightstack_upper)
      (on purple_block_rightstack_upper red_block_rightstack_lower)
    )
  )
)