(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    orange_top_left - block
    green_bottom_left - block
    blue_top_middle - block
    purple_bottom_middle - block
    red_top_right - block
    yellow_bottom_right - block
    robot_arm - robot
  )
  (:init
    (ontable green_bottom_left)
    (ontable purple_bottom_middle)
    (ontable yellow_bottom_right)

    (on orange_top_left green_bottom_left)
    (on blue_top_middle purple_bottom_middle)
    (on red_top_right yellow_bottom_right)

    (clear orange_top_left)
    (clear blue_top_middle)
    (clear red_top_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on blue_top_middle yellow_bottom_right)
      (on yellow_bottom_right orange_top_left)
      (ontable orange_top_left)

      (on green_bottom_left red_top_right)
      (on red_top_right purple_bottom_middle)
      (ontable purple_bottom_middle)
    )
  )
)