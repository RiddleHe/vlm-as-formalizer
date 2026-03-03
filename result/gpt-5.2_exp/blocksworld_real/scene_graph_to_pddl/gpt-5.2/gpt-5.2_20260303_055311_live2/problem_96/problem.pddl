(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_top_of_tower - block
    yellow_block_second_in_tower - block
    purple_block_middle_in_tower - block
    blue_block_second_from_bottom_in_tower - block
    green_block_bottom_of_tower - block
    orange_block_single_on_table - block
    robot_arm_1 - robot
  )
  (:init
    ;; table placements
    (ontable green_block_bottom_of_tower)
    (ontable orange_block_single_on_table)

    ;; current tower
    (on blue_block_second_from_bottom_in_tower green_block_bottom_of_tower)
    (on purple_block_middle_in_tower blue_block_second_from_bottom_in_tower)
    (on yellow_block_second_in_tower purple_block_middle_in_tower)
    (on red_block_top_of_tower yellow_block_second_in_tower)

    ;; clear blocks
    (clear red_block_top_of_tower)
    (clear orange_block_single_on_table)

    ;; robot state
    (handempty robot_arm_1)
  )
  (:goal
    (and
      ;; Stack 1: yellow over blue
      (on yellow_block_second_in_tower blue_block_second_from_bottom_in_tower)

      ;; Stack 2: purple over red over green over orange
      (on purple_block_middle_in_tower red_block_top_of_tower)
      (on red_block_top_of_tower green_block_bottom_of_tower)
      (on green_block_bottom_of_tower orange_block_single_on_table)
    )
  )
)