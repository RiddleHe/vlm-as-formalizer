(define (problem put_task_tomato_slice_in_trash)
  (:domain put_task)
  (:objects
    agent_robot - agent

    microwave_red_countertop_right - microwave
    fridge_tall_gray_back - fridge
    sink_double_basin_left - sink

    knife_black_handle_dishrack - knife

    trash_bin_green_floor_left
    dish_rack_white_by_sink
    cup_orange_hexagonal_counter
    coffee_machine_blue_counter
    toaster_red_counter - receptacle

    tomato_red_counter
    kettle_silver_blue_handle_counter
    mug_black_coffee_machine
    bread_loaf_left_counter
    fork_metal_counter
    bowl_white_inside_microwave - object
  )

  (:init
    (openable microwave_red_countertop_right)
    (openable fridge_tall_gray_back)
    (opened microwave_red_countertop_right)

    (inReceptacle bowl_white_inside_microwave microwave_red_countertop_right)
    (inReceptacle knife_black_handle_dishrack dish_rack_white_by_sink)
    (inReceptacle mug_black_coffee_machine coffee_machine_blue_counter)
  )

  (:goal
    (and
      (isSliced tomato_red_counter)
      (inReceptacle tomato_red_counter trash_bin_green_floor_left)
    )
  )
)