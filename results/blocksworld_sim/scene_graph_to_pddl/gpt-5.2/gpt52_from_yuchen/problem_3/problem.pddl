(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow_block_leftmost - block
    green_block_left_center - block
    pink_block_right_center - block
    red_block_right_bottom - block
    purple_block_right_top - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block_leftmost)
    (ontable green_block_left_center)
    (ontable pink_block_right_center)
    (ontable red_block_right_bottom)

    (clear yellow_block_leftmost)
    (clear green_block_left_center)
    (clear pink_block_right_center)
    (clear purple_block_right_top)

    (on purple_block_right_top red_block_right_bottom)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block_leftmost green_block_left_center)
      (on green_block_left_center pink_block_right_center)
      (on red_block_right_bottom purple_block_right_top)
    )
  )
)