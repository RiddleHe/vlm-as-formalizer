(define (problem heat_egg_and_trash)
  (:domain put_task)
  (:objects
    robot_agent - agent

    red_front_microwave_on_counter - microwave
    stainless_front_fridge_door_center - fridge
    right_counter_sink_basin - sink

    small_brown_egg_on_counter - object
    silver_kettle_with_blue_handle_on_counter - object
    tall_pinkish_bottle_on_counter - object
    black_toaster_left_of_microwave - object
    green_apple_on_blue_plate_in_microwave - object
    black_pot_on_stove_left - object
    black_pot_in_sink_right - object
    cardboard_box_stack_near_sink - object
    small_salt_shaker_on_island_counter - object
    white_trash_bin_floor_corner - receptacle
  )

  (:init
    (openable red_front_microwave_on_counter)
    (openable stainless_front_fridge_door_center)
    (opened stainless_front_fridge_door_center)

    (inReceptacle green_apple_on_blue_plate_in_microwave red_front_microwave_on_counter)
    (inReceptacle black_pot_in_sink_right right_counter_sink_basin)
  )

  (:goal
    (and
      (isHot small_brown_egg_on_counter)
      (inReceptacle small_brown_egg_on_counter white_trash_bin_floor_corner)
    )
  )
)