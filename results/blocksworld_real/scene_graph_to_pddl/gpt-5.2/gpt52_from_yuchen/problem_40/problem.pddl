(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_cube_block blue_cube_block yellow_cube_block purple_cube_block green_cube_block red_cube_block - block
    single_robot_arm - robot
  )
  (:init
    (ontable orange_cube_block)
    (ontable blue_cube_block)
    (ontable yellow_cube_block)
    (ontable purple_cube_block)
    (ontable green_cube_block)
    (ontable red_cube_block)

    (clear orange_cube_block)
    (clear blue_cube_block)
    (clear yellow_cube_block)
    (clear purple_cube_block)
    (clear green_cube_block)
    (clear red_cube_block)

    (handempty single_robot_arm)
  )
  (:goal
    (and
      (on purple_cube_block blue_cube_block)
      (on blue_cube_block yellow_cube_block)
      (on yellow_cube_block orange_cube_block)
      (on green_cube_block red_cube_block)
    )
  )
)