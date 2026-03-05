(define (problem put_task_problem_1)
  (:domain put_task)
  (:objects
    robot_agent - agent
    black_two_door_fridge_right_side - fridge
    white_sink_with_faucet_center_right - sink
    microwave - microwave
    black_table_left_of_sink - receptacle
    yellow_handle_knife_on_counter_right_of_faucet - knife
    brown_egg_on_white_counter_left_of_sink - object
    green_tomato_like_vegetable_in_sink_basin - object
    metal_spatula_in_sink_basin - object
    clear_salt_shaker_on_black_table - object
    square_brown_bowl_on_black_table - object
    dark_round_fruit_on_black_table_back_right - object
    black_trash_bag_on_floor_left - object
  )

  (:init
    (openable black_two_door_fridge_right_side)

    (inReceptacle green_tomato_like_vegetable_in_sink_basin white_sink_with_faucet_center_right)
    (inReceptacle metal_spatula_in_sink_basin white_sink_with_faucet_center_right)

    (inReceptacle clear_salt_shaker_on_black_table black_table_left_of_sink)
    (inReceptacle square_brown_bowl_on_black_table black_table_left_of_sink)
    (inReceptacle dark_round_fruit_on_black_table_back_right black_table_left_of_sink)
    (inReceptacle brown_egg_on_white_counter_left_of_sink black_table_left_of_sink)
  )

  (:goal
    (and
      (isClean green_tomato_like_vegetable_in_sink_basin)
      (inReceptacle green_tomato_like_vegetable_in_sink_basin black_table_left_of_sink)
    )
  )
)