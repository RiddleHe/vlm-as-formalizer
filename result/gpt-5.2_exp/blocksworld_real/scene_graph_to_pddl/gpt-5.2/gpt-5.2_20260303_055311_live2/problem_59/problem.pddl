(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow_block red_block purple_block orange_block blue_block green_block - block
    robot_arm - robot
  )
  (:init
    (ontable yellow_block)
    (ontable red_block)
    (ontable orange_block)
    (ontable green_block)

    (on purple_block orange_block)
    (on blue_block green_block)

    (clear yellow_block)
    (clear red_block)
    (clear purple_block)
    (clear blue_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_block blue_block)
      (on orange_block purple_block)
      (on red_block green_block)
    )
  )
)