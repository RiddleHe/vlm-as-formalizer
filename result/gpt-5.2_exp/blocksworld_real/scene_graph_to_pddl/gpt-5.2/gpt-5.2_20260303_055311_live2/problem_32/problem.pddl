(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple_top_left_stack - block
    blue_middle_left_stack - block
    yellow_bottom_left_stack - block
    orange_top_right_stack - block
    red_middle_right_stack - block
    green_bottom_right_stack - block
    robot_arm - robot
  )

  (:init
    (ontable yellow_bottom_left_stack)
    (ontable green_bottom_right_stack)

    (on blue_middle_left_stack yellow_bottom_left_stack)
    (on purple_top_left_stack blue_middle_left_stack)

    (on red_middle_right_stack green_bottom_right_stack)
    (on orange_top_right_stack red_middle_right_stack)

    (clear purple_top_left_stack)
    (clear orange_top_right_stack)

    (handempty robot_arm)
  )

  (:goal
    (and
      (on yellow_bottom_left_stack blue_middle_left_stack)
      (on blue_middle_left_stack purple_top_left_stack)
      (on purple_top_left_stack red_middle_right_stack)
      (on red_middle_right_stack green_bottom_right_stack)
      (on green_bottom_right_stack orange_top_right_stack)
    )
  )
)