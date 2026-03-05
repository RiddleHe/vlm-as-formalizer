(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    teal_blue_block orange_block green_block red_block purple_block pale_yellow_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable purple_block)
    (ontable pale_yellow_block)

    (on teal_blue_block orange_block)
    (on orange_block green_block)
    (on red_block purple_block)

    (clear teal_blue_block)
    (clear red_block)
    (clear pale_yellow_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_block red_block)
      (on blue_block orange_block)
      (on orange_block purple_block)
      (on purple_block pale_yellow_block)
    )
  )
)