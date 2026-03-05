(define (problem put_task_microwaved_mug_on_left_shelves)
  (:domain put_task)

  (:objects
    robot_agent - agent

    microwave_above_stove_silver_right_keypad - microwave
    black_side_shelf_left_of_table - receptacle
    white_table_right_side - receptacle
    brown_countertop_surface_left - receptacle
    gas_stove_top_white - receptacle

    small_glass_or_cup_on_black_side_shelf - object
    square_brown_pan_on_right_stove_burner - object
    red_coffee_machine_on_counter - object
    small_red_toaster_left_of_coffee_machine - object
    green_hexagon_trash_bin_under_counter - object
    loaf_of_bread_on_black_side_shelf - object
    red_apple_on_black_side_shelf - object
    dark_round_fruit_on_black_side_shelf - object
    small_spoon_on_black_side_shelf - object
    loaf_of_bread_on_white_table - object
  )

  (:init
    (openable microwave_above_stove_silver_right_keypad)

    (inReceptacle square_brown_pan_on_right_stove_burner gas_stove_top_white)
    (inReceptacle red_coffee_machine_on_counter brown_countertop_surface_left)
    (inReceptacle small_red_toaster_left_of_coffee_machine brown_countertop_surface_left)
    (inReceptacle green_hexagon_trash_bin_under_counter brown_countertop_surface_left)

    (inReceptacle loaf_of_bread_on_black_side_shelf black_side_shelf_left_of_table)
    (inReceptacle red_apple_on_black_side_shelf black_side_shelf_left_of_table)
    (inReceptacle dark_round_fruit_on_black_side_shelf black_side_shelf_left_of_table)
    (inReceptacle small_spoon_on_black_side_shelf black_side_shelf_left_of_table)
    (inReceptacle small_glass_or_cup_on_black_side_shelf black_side_shelf_left_of_table)

    (inReceptacle loaf_of_bread_on_white_table white_table_right_side)
  )

  (:goal
    (and
      (isHot small_glass_or_cup_on_black_side_shelf)
      (inReceptacle small_glass_or_cup_on_black_side_shelf black_side_shelf_left_of_table)
    )
  )
)