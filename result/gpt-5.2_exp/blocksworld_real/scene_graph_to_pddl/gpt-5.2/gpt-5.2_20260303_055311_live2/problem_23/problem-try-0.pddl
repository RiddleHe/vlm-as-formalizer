(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_cube_block green_cube_block yellow_cube_block
    purple_cube_block red_cube_block orange_cube_block - block
    robot_arm - robot
  )
  (:init
    ;; on-table blocks
    (ontable yellow_cube_block)
    (ontable orange_cube_block)
    (ontable red_cube_block)

    ;; stacks currently in the scene
    (on green_cube_block yellow_cube_block)
    (on blue_cube_block green_cube_block)
    (on purple_cube_block red_cube_block)

    ;; clear blocks
    (clear blue_cube_block)
    (clear purple_cube_block)
    (clear orange_cube_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      ;; stack 1: yellow over blue
      (on yellow_cube_block blue_cube_block)

      ;; stack 2: red over orange over green over purple
      (on red_cube_block orange_cube_block)
      (on orange_cube_block green_cube_block)
      (on green_cube_block purple_cube_block)
    )
  )
)