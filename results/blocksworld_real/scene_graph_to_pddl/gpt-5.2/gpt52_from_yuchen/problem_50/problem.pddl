(define (problem blocksworld_stacks_1)
  (:domain blocksworld)
  (:objects
    orange_top_left - block
    yellow_middle_left - block
    blue_bottom_left - block
    purple_top_right - block
    red_middle_right - block
    green_bottom_right - block
    robot_arm - robot
  )
  (:init
    (ontable blue_bottom_left)
    (ontable green_bottom_right)

    (on orange_top_left yellow_middle_left)
    (on yellow_middle_left blue_bottom_left)
    (on purple_top_right red_middle_right)
    (on red_middle_right green_bottom_right)

    (clear orange_top_left)
    (clear purple_top_right)

    (handempty robot_arm)
  )
  (:goal
    (and
      (on purple_top_right blue_bottom_left)
      (on blue_bottom_left green_bottom_right)
      (on green_bottom_right red_middle_right)
      (on red_middle_right orange_top_left)
      (on orange_top_left yellow_middle_left)
    )
  )
)