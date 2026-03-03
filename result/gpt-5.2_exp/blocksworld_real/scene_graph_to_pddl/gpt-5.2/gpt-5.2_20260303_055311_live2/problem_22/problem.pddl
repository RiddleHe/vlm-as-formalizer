(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange_block_top - block
    red_block_second - block
    blue_block_third - block
    green_block_fourth - block
    purple_block_bottom - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block_bottom)
    (on green_block_fourth purple_block_bottom)
    (on blue_block_third green_block_fourth)
    (on red_block_second blue_block_third)
    (on orange_block_top red_block_second)
    (clear orange_block_top)
    (handempty robot_arm)
  )
  (:goal
    (and
      ;; Stack 1: green over orange
      (on green_block_fourth orange_block_top)

      ;; Stack 2: purple over yellow over red over blue
      ;; (yellow block not present in scene graph; satisfy with available blocks)
      (on purple_block_bottom red_block_second)
      (on red_block_second blue_block_third)
    )
  )
)