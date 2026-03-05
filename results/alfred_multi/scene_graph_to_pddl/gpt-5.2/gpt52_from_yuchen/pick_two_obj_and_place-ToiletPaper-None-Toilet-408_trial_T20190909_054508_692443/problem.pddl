(define (problem put_task_bathroom_toilet_paper)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_plastic_trash_bin_near_wall - receptacle

    white_toilet_paper_roll_inside_trash_bin - object
    white_toilet_tank_right_side - object
    gray_double_basin_vanity_sink_left_side - object
    large_wall_mirror_above_sink - object
  )

  (:init
    (inReceptacle white_toilet_paper_roll_inside_trash_bin black_plastic_trash_bin_near_wall)
  )

  (:goal
    (and
      (inReceptacle white_toilet_paper_roll_inside_trash_bin white_toilet_tank_right_side)
    )
  )
)