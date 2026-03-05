(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    purple_cube_block yellow_cube_block red_cube_block orange_cube_block blue_cube_block green_cube_block - block
    robot_arm - robot
  )
  (:init
    (ontable green_cube_block)
    (on blue_cube_block green_cube_block)
    (on orange_cube_block blue_cube_block)
    (on red_cube_block orange_cube_block)
    (on yellow_cube_block red_cube_block)
    (on purple_cube_block yellow_cube_block)
    (clear purple_cube_block)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_cube_block red_cube_block)
      (on yellow_cube_block orange_cube_block)
      (on orange_cube_block green_cube_block)
      (on green_cube_block blue_cube_block)
    )
  )
)