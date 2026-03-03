(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_block pale_yellow_block blue_block orange_block red_block purple_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_block)
    (ontable pale_yellow_block)
    (ontable blue_block)
    (ontable red_block)
    (ontable purple_block)

    (on orange_block blue_block)

    (clear green_block)
    (clear pale_yellow_block)
    (clear orange_block)
    (clear red_block)
    (clear purple_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_block pale_yellow_block)
      (on pale_yellow_block orange_block)
      (on orange_block red_block)
      (on red_block blue_block)
      (on blue_block green_block)
    )
  )
)