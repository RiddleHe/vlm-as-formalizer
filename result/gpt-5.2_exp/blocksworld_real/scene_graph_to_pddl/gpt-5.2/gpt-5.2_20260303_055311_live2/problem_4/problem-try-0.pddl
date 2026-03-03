(define (problem blocksworld_scene_stacks_2)
  (:domain blocksworld)
  (:objects
    block_orange_top block_red_second block_purple_third
    block_blue_fourth block_yellow_fifth block_green_bottom - block
    robot_arm_assumed - robot
  )
  (:init
    (ontable block_green_bottom)
    (on block_yellow_fifth block_green_bottom)
    (on block_blue_fourth block_yellow_fifth)
    (on block_purple_third block_blue_fourth)
    (on block_red_second block_purple_third)
    (on block_orange_top block_red_second)
    (clear block_orange_top)
    (handempty robot_arm_assumed)
  )
  (:goal
    (and
      (on block_purple_third block_green_bottom)
      (on block_blue_fourth block_red_second)
      (on block_red_second block_orange_top)
      (on block_orange_top block_yellow_fifth)
    )
  )
)