(define (problem blocksworld_stack_red_blue_purple_pink)
  (:domain blocksworld)
  (:objects
    pink_block_top - block
    purple_block_middle - block
    blue_block_bottom - block
    red_block_right - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block_bottom)
    (ontable red_block_right)
    (on purple_block_middle blue_block_bottom)
    (on pink_block_top purple_block_middle)
    (clear pink_block_top)
    (clear red_block_right)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block_right blue_block_bottom)
      (on blue_block_bottom purple_block_middle)
      (on purple_block_middle pink_block_top)
    )
  )
)