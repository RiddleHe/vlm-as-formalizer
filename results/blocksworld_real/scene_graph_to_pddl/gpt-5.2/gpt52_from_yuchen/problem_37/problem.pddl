(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    green_block pale_yellow_block blue_block orange_block purple_block red_block - block
    robot_arm - robot
  )
  (:init
    (ontable red_block)
    (on purple_block red_block)
    (on orange_block purple_block)
    (on blue_block orange_block)
    (on pale_yellow_block blue_block)
    (on green_block pale_yellow_block)
    (clear green_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (ontable red_block)
      (on orange_block red_block)
      (on purple_block orange_block)
      (on yellow_block purple_block)
      (on blue_block yellow_block)
      (on green_block blue_block)
    )
  )
)