(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green_block_top blue_block_second yellow_block_middle red_block_lower purple_block_bottom orange_block_single - block
    robot_arm - robot
  )
  (:init
    (ontable purple_block_bottom)
    (ontable orange_block_single)

    (clear green_block_top)
    (clear orange_block_single)

    (handempty robot_arm)

    (on green_block_top blue_block_second)
    (on blue_block_second yellow_block_middle)
    (on yellow_block_middle red_block_lower)
    (on red_block_lower purple_block_bottom)
  )
  (:goal
    (and
      (on purple_block_bottom red_block_lower)
      (on red_block_lower blue_block_second)
      (on blue_block_second orange_block_single)
      (on orange_block_single yellow_block_middle)
      (on yellow_block_middle green_block_top)
    )
  )
)