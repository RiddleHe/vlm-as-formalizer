(define (problem blocksworld_stacking_task_1)
  (:domain blocksworld)
  (:objects
    green_block_left - block
    blue_block_left - block
    orange_block_front - block
    yellow_block_bottom_stack - block
    red_block_middle_stack - block
    purple_block_top_stack - block
    robot_arm - robot
  )
  (:init
    (ontable green_block_left)
    (ontable blue_block_left)
    (ontable orange_block_front)
    (ontable yellow_block_bottom_stack)

    (on red_block_middle_stack yellow_block_bottom_stack)
    (on purple_block_top_stack red_block_middle_stack)

    (clear green_block_left)
    (clear blue_block_left)
    (clear orange_block_front)
    (clear purple_block_top_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block_front purple_block_top_stack)
      (on purple_block_top_stack red_block_middle_stack)
      (on red_block_middle_stack blue_block_left)
      (on blue_block_left yellow_block_bottom_stack)
      (on yellow_block_bottom_stack green_block_left)
    )
  )
)