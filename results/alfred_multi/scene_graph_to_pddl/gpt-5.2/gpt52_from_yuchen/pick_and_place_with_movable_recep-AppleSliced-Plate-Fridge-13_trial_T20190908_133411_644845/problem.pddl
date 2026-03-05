(define (problem put_plate_knife_applepiece_in_fridge)
  (:domain put_task)
  (:objects
    robot - agent

    microwave_red_silver_on_upper_shelf - microwave
    fridge_black_double_door_lower_center - fridge
    sink_bowl_gray_on_counter - sink

    plate_blue_square_on_counter - receptacle
    knife_brown_handle_on_counter_right_of_watermelon - knife

    watermelon_whole_green_on_counter_center - object
    bread_loaf_brown_on_counter_right - object
    potato_brown_on_counter_left_of_plate - object
    sponge_green_on_counter_left - object
    cup_dark_gray_on_counter_left - object
    salt_shaker_clear_on_counter_near_sink - object
    photos_pile_left_of_watermelon - object
    photos_pile_right_of_watermelon - object
  )

  (:init
    (openable microwave_red_silver_on_upper_shelf)
    (openable fridge_black_double_door_lower_center)
  )

  (:goal
    (and
      (inReceptacle plate_blue_square_on_counter fridge_black_double_door_lower_center)
      (inReceptacle knife_brown_handle_on_counter_right_of_watermelon fridge_black_double_door_lower_center)
      (inReceptacle watermelon_whole_green_on_counter_center fridge_black_double_door_lower_center)
    )
  )
)