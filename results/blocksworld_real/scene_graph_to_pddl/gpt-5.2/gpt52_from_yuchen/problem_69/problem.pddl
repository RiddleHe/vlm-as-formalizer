(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_block orange_block yellow_block green_block red_block blue_block - block
    single_robot - robot
  )
  (:init
    (ontable purple_block)
    (ontable orange_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable red_block)

    (on blue_block red_block)

    (clear purple_block)
    (clear orange_block)
    (clear yellow_block)
    (clear green_block)
    (clear blue_block)

    (handempty single_robot)
  )
  (:goal
    (and
      (on yellow_block orange_block)
      (on green_block purple_block)
      (on purple_block red_block)
      (on red_block blue_block)
    )
  )
)