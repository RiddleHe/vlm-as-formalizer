(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    orange_block_base - block
    blue_block_middle - block
    green_block_top - block
    yellow_block_center - block
    red_block_right - block
    purple_block_front - block
    robot_arm_1 - robot
  )
  (:init
    (ontable orange_block_base)
    (ontable yellow_block_center)
    (ontable red_block_right)
    (ontable purple_block_front)

    (on blue_block_middle orange_block_base)
    (on green_block_top blue_block_middle)

    (clear green_block_top)
    (clear yellow_block_center)
    (clear red_block_right)
    (clear purple_block_front)

    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on orange_block_base yellow_block_center)
      (on yellow_block_center green_block_top)
      (on green_block_top purple_block_front)
      (on purple_block_front red_block_right)
      (on red_block_right blue_block_middle)
    )
  )
)