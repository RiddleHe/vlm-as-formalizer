(define (problem blocksworld_two_stacks)
  (:domain blocksworld)
  (:objects
    red_block_top orange_block purple_block pink_block yellow_block green_block_bottom - block
    robot_arm_1 - robot
  )
  (:init
    (ontable green_block_bottom)
    (on yellow_block green_block_bottom)
    (on pink_block yellow_block)
    (on purple_block pink_block)
    (on orange_block purple_block)
    (on red_block_top orange_block)
    (clear red_block_top)
    (handempty robot_arm_1)
  )
  (:goal
    (and
      (on yellow_block pink_block)
      (on green_block_bottom yellow_block)
      (on orange_block red_block_top)
      (on purple_block orange_block)
    )
  )
)