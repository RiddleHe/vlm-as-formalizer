(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green_cube_top_of_stack - block
    blue_cube_middle_of_stack - block
    orange_cube_bottom_of_stack - block
    yellow_cube_center - block
    red_cube_right - block
    purple_cube_front - block
    robot_arm - robot
  )
  (:init
    (ontable orange_cube_bottom_of_stack)
    (ontable yellow_cube_center)
    (ontable red_cube_right)
    (ontable purple_cube_front)

    (on green_cube_top_of_stack blue_cube_middle_of_stack)
    (on blue_cube_middle_of_stack orange_cube_bottom_of_stack)

    (clear green_cube_top_of_stack)
    (clear yellow_cube_center)
    (clear red_cube_right)
    (clear purple_cube_front)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_cube_bottom_of_stack yellow_cube_center)
      (on yellow_cube_center green_cube_top_of_stack)
      (on green_cube_top_of_stack purple_cube_front)
      (on purple_cube_front red_cube_right)
      (on red_cube_right blue_cube_middle_of_stack)
    )
  )
)