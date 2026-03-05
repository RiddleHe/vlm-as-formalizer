(define (problem put_task_chill_tomato_microwave)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_microwave_right_counter - microwave
    tall_black_fridge_center_view - fridge
    white_sink_bottom_left - sink

    brown_countertop_surface - receptacle
    white_stove_oven_unit - receptacle
    silver_toaster_right_counter - receptacle

    metal_spatula_like_tool_left_counter - knife

    gray_tomato_on_counter - object
    copper_pot_front_burner - object
    copper_pot_back_burner - object
    small_silver_cup_left_of_stove - object
  )

  (:init
    (openable black_microwave_right_counter)
    (openable tall_black_fridge_center_view)

    (inReceptacle copper_pot_front_burner white_stove_oven_unit)
    (inReceptacle copper_pot_back_burner white_stove_oven_unit)

    (inReceptacle small_silver_cup_left_of_stove brown_countertop_surface)
    (inReceptacle gray_tomato_on_counter brown_countertop_surface)
    (inReceptacle metal_spatula_like_tool_left_counter brown_countertop_surface)
    (inReceptacle silver_toaster_right_counter brown_countertop_surface)
    (inReceptacle black_microwave_right_counter brown_countertop_surface)
    (inReceptacle white_stove_oven_unit brown_countertop_surface)
  )

  (:goal
    (and
      (isCool gray_tomato_on_counter)
      (inReceptacle gray_tomato_on_counter black_microwave_right_counter)
    )
  )
)