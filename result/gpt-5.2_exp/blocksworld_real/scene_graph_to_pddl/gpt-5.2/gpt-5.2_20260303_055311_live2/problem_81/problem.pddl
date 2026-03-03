(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    yellow_block_top_of_tower - block
    purple_block_second_from_top - block
    blue_block_middle - block
    green_block_second_from_bottom - block
    red_block_bottom_of_tower - block
    orange_block_single_on_table_right - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_bottom_of_tower)
    (ontable orange_block_single_on_table_right)

    (on yellow_block_top_of_tower purple_block_second_from_top)
    (on purple_block_second_from_top blue_block_middle)
    (on blue_block_middle green_block_second_from_bottom)
    (on green_block_second_from_bottom red_block_bottom_of_tower)

    (clear yellow_block_top_of_tower)
    (clear orange_block_single_on_table_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block_second_from_bottom red_block_bottom_of_tower)
      (on purple_block_second_from_top yellow_block_top_of_tower)
      (on blue_block_middle orange_block_single_on_table_right)
    )
  )
)