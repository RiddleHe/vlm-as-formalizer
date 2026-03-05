(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_block_top - block
    red_block_second - block
    blue_block_third - block
    green_block_fourth - block
    purple_block_bottom - block
    robot_arm_1 - robot
  )
  (:init
    (ontable purple_block_bottom)
    (on green_block_fourth purple_block_bottom)
    (on blue_block_third green_block_fourth)
    (on red_block_second blue_block_third)
    (on orange_block_top red_block_second)
    (clear orange_block_top)
    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on green_block_fourth orange_block_top)
      (on purple_block_bottom yellow_block)
      (on yellow_block red_block_second)
      (on red_block_second blue_block_third)
    )
  )
)