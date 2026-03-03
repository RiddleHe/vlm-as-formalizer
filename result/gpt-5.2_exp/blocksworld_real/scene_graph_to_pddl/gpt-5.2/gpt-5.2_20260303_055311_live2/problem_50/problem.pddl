(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_block_left_top - block
    yellow_block_left_middle - block
    blue_block_left_bottom - block
    purple_block_right_top - block
    red_block_right_middle - block
    green_block_right_bottom - block
    robot_arm - robot
  )
  (:init
    (ontable blue_block_left_bottom)
    (ontable green_block_right_bottom)

    (on yellow_block_left_middle blue_block_left_bottom)
    (on orange_block_left_top yellow_block_left_middle)

    (on red_block_right_middle green_block_right_bottom)
    (on purple_block_right_top red_block_right_middle)

    (clear orange_block_left_top)
    (clear purple_block_right_top)

    (handempty robot_arm)
  )
  (:goal
    (and
      (ontable yellow_block_left_middle)
      (on orange_block_left_top yellow_block_left_middle)
      (on red_block_right_middle orange_block_left_top)
      (on green_block_right_bottom red_block_right_middle)
      (on blue_block_left_bottom green_block_right_bottom)
      (on purple_block_right_top blue_block_left_bottom)
    )
  )
)