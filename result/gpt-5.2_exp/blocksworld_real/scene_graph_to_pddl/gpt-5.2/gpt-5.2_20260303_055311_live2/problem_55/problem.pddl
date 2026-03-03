(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_left - block
    orange_block_leftfront - block
    green_block_center - block
    blue_block_backcenter - block
    yellow_block_backright - block
    purple_block_rightfront - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_left)
    (ontable orange_block_leftfront)
    (ontable green_block_center)
    (ontable blue_block_backcenter)
    (ontable yellow_block_backright)
    (ontable purple_block_rightfront)

    (clear red_block_left)
    (clear orange_block_leftfront)
    (clear green_block_center)
    (clear blue_block_backcenter)
    (clear yellow_block_backright)
    (clear purple_block_rightfront)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block_center orange_block_leftfront)
      (on orange_block_leftfront red_block_left)

      (on blue_block_backcenter purple_block_rightfront)
      (on purple_block_rightfront yellow_block_backright)
    )
  )
)