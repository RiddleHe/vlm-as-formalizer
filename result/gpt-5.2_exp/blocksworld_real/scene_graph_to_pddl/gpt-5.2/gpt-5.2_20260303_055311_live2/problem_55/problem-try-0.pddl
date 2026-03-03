(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block_left orange_block_frontleft green_block_center
    blue_block_backcenter yellow_block_backright purple_block_frontright - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_left)
    (ontable orange_block_frontleft)
    (ontable green_block_center)
    (ontable blue_block_backcenter)
    (ontable yellow_block_backright)
    (ontable purple_block_frontright)

    (clear red_block_left)
    (clear orange_block_frontleft)
    (clear green_block_center)
    (clear blue_block_backcenter)
    (clear yellow_block_backright)
    (clear purple_block_frontright)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_block_frontleft red_block_left)
      (on green_block_center orange_block_frontleft)
      (on purple_block_frontright yellow_block_backright)
      (on blue_block_backcenter purple_block_frontright)
    )
  )
)