(define (problem blocksworld_scene_stack_1)
  (:domain blocksworld)
  (:objects
    green_top_block pale_yellow_block blue_block orange_block purple_block red_bottom_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_bottom_block)
    (on purple_block red_bottom_block)
    (on orange_block purple_block)
    (on blue_block orange_block)
    (on pale_yellow_block blue_block)
    (on green_top_block pale_yellow_block)
    (clear green_top_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_top_block blue_block)
      (on blue_block pale_yellow_block)
      (on pale_yellow_block purple_block)
      (on purple_block orange_block)
      (on orange_block red_bottom_block)
      (ontable red_bottom_block)
    )
  )
)