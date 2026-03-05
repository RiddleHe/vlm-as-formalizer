(define (problem blocksworld_stack_all)
  (:domain blocksworld)
  (:objects
    purple_block_top - block
    blue_block_in_stack - block
    green_block_in_stack - block
    yellow_block_in_stack - block
    red_block_bottom_of_stack - block
    orange_block_left - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_bottom_of_stack)
    (ontable orange_block_left)

    (on yellow_block_in_stack red_block_bottom_of_stack)
    (on green_block_in_stack yellow_block_in_stack)
    (on blue_block_in_stack green_block_in_stack)
    (on purple_block_top blue_block_in_stack)

    (clear purple_block_top)
    (clear orange_block_left)

    (handempty robot_arm)
  )
  (:goal
    (and
      (ontable orange_block_left)
      (on red_block_bottom_of_stack orange_block_left)
      (on yellow_block_in_stack red_block_bottom_of_stack)
      (on green_block_in_stack yellow_block_in_stack)
      (on blue_block_in_stack green_block_in_stack)
      (on purple_block_top blue_block_in_stack)
    )
  )
)