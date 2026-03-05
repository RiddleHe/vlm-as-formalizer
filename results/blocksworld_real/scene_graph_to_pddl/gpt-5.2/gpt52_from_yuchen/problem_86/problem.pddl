(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red_block green_block yellow_block orange_block purple_block blue_block - block
    robot_arm - robot
  )
  (:init
    ;; stacks present in the scene
    (on red_block green_block)
    (on yellow_block orange_block)

    ;; blocks on the table
    (ontable green_block)
    (ontable orange_block)
    (ontable purple_block)
    (ontable blue_block)

    ;; clear blocks
    (clear red_block)
    (clear yellow_block)
    (clear purple_block)
    (clear blue_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      ;; stack 1: green over orange over purple over blue
      (on green_block orange_block)
      (on orange_block purple_block)
      (on purple_block blue_block)

      ;; stack 2: yellow over red
      (on yellow_block red_block)
    )
  )
)