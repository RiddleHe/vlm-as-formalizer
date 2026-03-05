(define (problem move_toilet_paper_to_dispenser)
  (:domain put_task)
  (:objects
    robot_agent - agent

    dark_marble_bathroom_countertop_surface - receptacle
    white_rectangular_sink_basin_right_counter - sink
    wall_mounted_toilet_paper_dispenser_left_of_toilet - receptacle

    toilet_paper_roll_on_right_counter - object
    crumpled_white_tissue_on_counter - object
    teal_toothbrush_on_counter - object
    small_pink_item_in_sink - object
    toilet_with_tank_and_lid - object
    black_rubber_plunger_on_floor - object
    toilet_brush_in_holder_on_floor - object
  )

  (:init
    (inReceptacle toilet_paper_roll_on_right_counter dark_marble_bathroom_countertop_surface)
    (inReceptacle crumpled_white_tissue_on_counter dark_marble_bathroom_countertop_surface)
    (inReceptacle teal_toothbrush_on_counter dark_marble_bathroom_countertop_surface)
    (inReceptacle small_pink_item_in_sink white_rectangular_sink_basin_right_counter)
  )

  (:goal
    (and
      (inReceptacle toilet_paper_roll_on_right_counter wall_mounted_toilet_paper_dispenser_left_of_toilet)
    )
  )
)