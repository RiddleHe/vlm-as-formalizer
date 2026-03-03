(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    blue_block_top - block
    yellow_block_upper - block
    orange_block_upper - block
    green_block_middle - block
    red_block_lower - block
    purple_block_bottom - block
    robot_arm_1 - robot
  )
  (:init
    (ontable purple_block_bottom)
    (on red_block_lower purple_block_bottom)
    (on green_block_middle red_block_lower)
    (on orange_block_upper green_block_middle)
    (on yellow_block_upper orange_block_upper)
    (on blue_block_top yellow_block_upper)
    (clear blue_block_top)
    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on red_block_lower blue_block_top)
      (on orange_block_upper yellow_block_upper)
      (on purple_block_bottom green_block_middle)
    )
  )
)