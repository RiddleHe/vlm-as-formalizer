(define (problem put_grey_plate_with_candle_on_coffee_table)
  (:domain put_task)

  (:objects
    agent_robot - agent

    dining_table_wooden_large - receptacle
    coffee_table_wooden_low - receptacle
    grey_plate_top_left_on_dining_table - receptacle
    grey_plate_top_right_on_dining_table - receptacle
    grey_plate_center_left_on_dining_table - receptacle
    grey_plate_bottom_right_on_dining_table - receptacle
    tissue_box_green_on_dining_table - receptacle
    cardboard_box_open_on_coffee_table - receptacle
    plant_pot_white_on_coffee_table - receptacle
    vase_dark_on_coffee_table - receptacle

    laptop_black_open_on_dining_table - object
    candle_lightgreen_cylinder_on_dining_table - object
    remote_control_grey_on_dining_table - object
    small_blue_item_on_dining_table_near_plates - object
    two_newspapers_stacked_on_dining_table - object
    small_blue_item_on_coffee_table - object
  )

  (:init
    ;; robot starts not holding anything; no atLocation facts initially
    ;; scene layout (inReceptacle)
    (inReceptacle laptop_black_open_on_dining_table dining_table_wooden_large)
    (inReceptacle candle_lightgreen_cylinder_on_dining_table dining_table_wooden_large)
    (inReceptacle remote_control_grey_on_dining_table dining_table_wooden_large)
    (inReceptacle small_blue_item_on_dining_table_near_plates dining_table_wooden_large)
    (inReceptacle two_newspapers_stacked_on_dining_table dining_table_wooden_large)
    (inReceptacle grey_plate_top_left_on_dining_table dining_table_wooden_large)
    (inReceptacle grey_plate_top_right_on_dining_table dining_table_wooden_large)
    (inReceptacle grey_plate_center_left_on_dining_table dining_table_wooden_large)
    (inReceptacle grey_plate_bottom_right_on_dining_table dining_table_wooden_large)
    (inReceptacle tissue_box_green_on_dining_table dining_table_wooden_large)

    (inReceptacle cardboard_box_open_on_coffee_table coffee_table_wooden_low)
    (inReceptacle plant_pot_white_on_coffee_table coffee_table_wooden_low)
    (inReceptacle vase_dark_on_coffee_table coffee_table_wooden_low)
    (inReceptacle small_blue_item_on_coffee_table coffee_table_wooden_low)
  )

  (:goal
    (and
      ;; put a grey plate with the candle on it on the coffee table
      (inReceptacle grey_plate_top_left_on_dining_table coffee_table_wooden_low)
      (inReceptacle candle_lightgreen_cylinder_on_dining_table grey_plate_top_left_on_dining_table)
    )
  )
)