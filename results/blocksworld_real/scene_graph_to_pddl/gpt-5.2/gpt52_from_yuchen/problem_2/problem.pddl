(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    orange_block_top_of_tall_stack - block
    blue_block_in_tall_stack - block
    purple_block_in_tall_stack - block
    red_block_bottom_of_tall_stack - block
    green_block_top_of_short_stack - block
    yellow_block_bottom_of_short_stack - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_bottom_of_tall_stack)
    (ontable yellow_block_bottom_of_short_stack)

    (on purple_block_in_tall_stack red_block_bottom_of_tall_stack)
    (on blue_block_in_tall_stack purple_block_in_tall_stack)
    (on orange_block_top_of_tall_stack blue_block_in_tall_stack)
    (on green_block_top_of_short_stack yellow_block_bottom_of_short_stack)

    (clear orange_block_top_of_tall_stack)
    (clear green_block_top_of_short_stack)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block_top_of_short_stack red_block_bottom_of_tall_stack)
      (on red_block_bottom_of_tall_stack purple_block_in_tall_stack)
      (on purple_block_in_tall_stack blue_block_in_tall_stack)
      (on blue_block_in_tall_stack orange_block_top_of_tall_stack)
      (on orange_block_top_of_tall_stack yellow_block_bottom_of_short_stack)
    )
  )
)