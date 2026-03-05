(define (problem blocksworld_stack1)
  (:domain blocksworld)
  (:objects
    green_cube_block purple_cube_block yellow_cube_block orange_cube_block blue_cube_block red_cube_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_cube_block)
    (ontable purple_cube_block)
    (ontable yellow_cube_block)
    (ontable orange_cube_block)
    (ontable red_cube_block)
    (on blue_cube_block red_cube_block)

    (clear green_cube_block)
    (clear purple_cube_block)
    (clear yellow_cube_block)
    (clear orange_cube_block)
    (clear blue_cube_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on green_cube_block purple_cube_block)
      (on purple_cube_block red_cube_block)
      (on red_cube_block blue_cube_block)
      (on blue_cube_block yellow_cube_block)
      (on yellow_cube_block orange_cube_block)
    )
  )
)