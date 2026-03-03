(define (problem blocksworld_stack_1)
  (:domain blocksworld)
  (:objects
    blue_cube_block
    orange_cube_block
    green_cube_block
    purple_cube_block
    red_cube_block
    pale_yellow_cube_block
    robot_arm - robot
  )
  (:init
    (ontable blue_cube_block)
    (ontable pale_yellow_cube_block)
    (ontable red_cube_block)
    (ontable purple_cube_block)

    (on orange_cube_block green_cube_block)
    (on green_cube_block red_cube_block)

    (clear blue_cube_block)
    (clear pale_yellow_cube_block)
    (clear orange_cube_block)
    (clear purple_cube_block)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_cube_block orange_cube_block)
      (on orange_cube_block green_cube_block)
      (on green_cube_block purple_cube_block)
      (on purple_cube_block red_cube_block)
      (on red_cube_block pale_yellow_cube_block)
    )
  )
)