(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_top_left_block - block
    green_bottom_left_block - block
    blue_top_middle_block - block
    purple_bottom_middle_block - block
    red_top_right_block - block
    yellow_bottom_right_block - block
    robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable green_bottom_left_block)
    (ontable purple_bottom_middle_block)
    (ontable yellow_bottom_right_block)

    ;; stacks in the scene
    (on orange_top_left_block green_bottom_left_block)
    (on blue_top_middle_block purple_bottom_middle_block)
    (on red_top_right_block yellow_bottom_right_block)

    ;; clear blocks
    (clear orange_top_left_block)
    (clear blue_top_middle_block)
    (clear red_top_right_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      ;; Stack 1: blue over yellow over orange
      (on blue_top_middle_block yellow_bottom_right_block)
      (on yellow_bottom_right_block orange_top_left_block)

      ;; Stack 2: green over red over purple
      (on green_bottom_left_block red_top_right_block)
      (on red_top_right_block purple_bottom_middle_block)
    )
  )
)