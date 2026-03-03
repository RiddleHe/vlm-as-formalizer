(define (problem blocksworld_scene_stacks_3)
  (:domain blocksworld)
  (:objects
    green_cube_block orange_cube_block yellow_cube_block
    red_cube_block blue_cube_block purple_cube_block - block
    robot_arm - robot
  )
  (:init
    ;; blocks on table
    (ontable green_cube_block)
    (ontable orange_cube_block)
    (ontable yellow_cube_block)
    (ontable red_cube_block)
    (ontable blue_cube_block)

    ;; existing stack
    (on purple_cube_block blue_cube_block)

    ;; clear blocks
    (clear green_cube_block)
    (clear orange_cube_block)
    (clear yellow_cube_block)
    (clear red_cube_block)
    (clear purple_cube_block)

    ;; robot state (assume available and handempty)
    (handempty robot_arm)
  )
  (:goal
    (and
      (on yellow_cube_block orange_cube_block)
      (on blue_cube_block red_cube_block)
      (on green_cube_block purple_cube_block)
    )
  )
)