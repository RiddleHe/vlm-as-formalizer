(define (problem put_salt_shaker_in_drawer)
  (:domain put_task)
  (:objects
    robot - agent

    microwave - microwave
    fridge - fridge
    sink_basin_left_counter - sink

    cabinet_drawer_open_lower_left - receptacle

    kitchen_knife_yellow_handle_left_counter - knife

    silver_two_slot_toaster_right_counter
    coffee_machine_right_counter
    white_egg_on_counter_near_toaster
    frying_pan_left_counter
    frying_pan_on_stove_right_burner
    stove_oven_unit_center
    kettle_left_on_stove
    kettle_right_on_stove
    fork_left_counter
    fork_right_counter
    spoon_on_sink
    mug_in_sink
    red_apple_in_sink
    salt_shaker - object
  )
  (:init
    (openable cabinet_drawer_open_lower_left)
    (opened cabinet_drawer_open_lower_left)

    (inReceptacle mug_in_sink sink_basin_left_counter)
    (inReceptacle spoon_on_sink sink_basin_left_counter)
    (inReceptacle red_apple_in_sink sink_basin_left_counter)
  )
  (:goal
    (and
      (inReceptacle salt_shaker cabinet_drawer_open_lower_left)
    )
  )
)