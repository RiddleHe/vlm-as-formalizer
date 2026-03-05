(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    blue_single_cube - block
    green_cube - block
    orange_bottom_cube - block
    yellow_middle_cube - block
    purple_bottom_cube - block
    red_top_cube - block
    robot_arm - robot
  )
  (:init
    (ontable blue_single_cube)
    (ontable orange_bottom_cube)
    (ontable purple_bottom_cube)

    (on green_cube orange_bottom_cube)
    (on yellow_middle_cube purple_bottom_cube)
    (on red_top_cube yellow_middle_cube)

    (clear blue_single_cube)
    (clear green_cube)
    (clear red_top_cube)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on orange_bottom_cube yellow_middle_cube)
      (on yellow_middle_cube purple_bottom_cube)
      (on purple_bottom_cube red_top_cube)
      (on red_top_cube blue_single_cube)
      (on blue_single_cube green_cube)
    )
  )
)