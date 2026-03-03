(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    blue_block_top yellow_block_second red_block_middle orange_block_fourth green_block_bottom purple_block_single - block
    robot_arm - robot
  )
  (:init
    (ontable green_block_bottom)
    (ontable purple_block_single)

    (on blue_block_top yellow_block_second)
    (on yellow_block_second red_block_middle)
    (on red_block_middle orange_block_fourth)
    (on orange_block_fourth green_block_bottom)

    (clear blue_block_top)
    (clear purple_block_single)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on red_block_middle blue_block_top)
      (on yellow_block_second green_block_bottom)
      (on green_block_bottom orange_block_fourth)
      (on orange_block_fourth purple_block_single)
    )
  )
)