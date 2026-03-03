(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block_front_stack
    purple_block_front_stack
    yellow_block_front_stack
    green_block_back_stack
    red_block_back_stack
    orange_block_back_stack
    - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block_front_stack)
    (ontable orange_block_back_stack)

    (on blue_block_front_stack purple_block_front_stack)
    (on purple_block_front_stack yellow_block_front_stack)
    (on green_block_back_stack red_block_back_stack)
    (on red_block_back_stack orange_block_back_stack)

    (clear blue_block_front_stack)
    (clear green_block_back_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_block_front_stack yellow_block_front_stack)
      (ontable yellow_block_front_stack)
      (clear blue_block_front_stack)

      (on orange_block_back_stack red_block_back_stack)
      (on red_block_back_stack purple_block_front_stack)
      (on purple_block_front_stack green_block_back_stack)
      (ontable green_block_back_stack)
      (clear orange_block_back_stack)
    )
  )
)