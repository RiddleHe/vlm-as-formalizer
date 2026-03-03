(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    red_block_left orange_block_centerleft blue_block_backcenter
    yellow_block_top green_block_bottom purple_block_right - block
    robot_arm - robot
  )
  (:init
    (ontable red_block_left)
    (ontable orange_block_centerleft)
    (ontable blue_block_backcenter)
    (ontable green_block_bottom)
    (ontable purple_block_right)

    (on yellow_block_top green_block_bottom)

    (clear red_block_left)
    (clear orange_block_centerleft)
    (clear blue_block_backcenter)
    (clear yellow_block_top)
    (clear purple_block_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block_top orange_block_centerleft)
      (on orange_block_centerleft purple_block_right)
      (on purple_block_right green_block_bottom)
      (on green_block_bottom blue_block_backcenter)
      (on blue_block_backcenter red_block_left)
    )
  )
)