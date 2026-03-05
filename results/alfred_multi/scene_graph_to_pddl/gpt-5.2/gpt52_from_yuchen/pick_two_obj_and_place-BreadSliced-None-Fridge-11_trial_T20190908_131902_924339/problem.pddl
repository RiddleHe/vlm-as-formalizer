(define (problem put_task_sliced_bread_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_red_on_counter - microwave
    fridge_tall_gray_by_back_wall - fridge
    sink_double_basin_left_counter - sink

    knife_yellow_handle_on_table - knife

    bread_loaf_on_black_counter_by_stove - object
    bread_loaf_on_white_table - object
    salt_shaker_small_on_black_counter - object
    salt_shaker_small_on_table - object
    bowl_metal_on_table - object
    tomato_red_left_of_bowl - object
    tomato_red_near_bread - object
    apple_red_on_right_table - object
    cup_black_left_front_table - object
    cup_black_right_table - object
    sponge_green_left_table - object
    sponge_green_right_table - object
    spoon_white_on_table - object
    egg_white_on_table_right - object
    egg_white_on_table_left - object
    paper_towel_roll_on_right_counter - object
    fork_metal_on_right_counter - object
    kettle_metal_on_stove - object
    pan_red_on_stove - object
    spatula_blue_in_sink_area - object
  )

  (:init
    (openable microwave_red_on_counter)
    (openable fridge_tall_gray_by_back_wall)
    ; no receptacles are initially opened (per scene graph)

    ; robot initially not at any object's location (per instruction)
  )

  (:goal
    (and
      (isSliced bread_loaf_on_white_table)
      (inReceptacle bread_loaf_on_white_table fridge_tall_gray_by_back_wall)
    )
  )
)