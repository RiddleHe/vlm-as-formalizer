(define (problem put_task_lettuce_washed_slice_on_counter)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_fridge_right_of_counter - fridge
    stainless_sink_in_counter - sink
    counter_by_sink - receptacle

    yellow_handle_knife_on_round_table - knife
    yellow_handle_knife_upright_near_sink_counter - knife

    lettuce_green_head_on_round_table_center - object
    lettuce_green_head_on_round_table_right - object
    tomato_red_on_round_table - object
    small_red_tomato_on_round_table_back - object
    potato_brown_in_sink - object
    onion_brown_in_sink - object
    coffee_machine_on_round_table - object
    soap_dispenser_gray_left_on_round_table - object
    soap_dispenser_gray_right_on_round_table - object
    salt_shaker_on_round_table - object
    round_wood_table - object
  )

  (:init
    (openable black_fridge_right_of_counter)

    (inReceptacle potato_brown_in_sink stainless_sink_in_counter)
    (inReceptacle onion_brown_in_sink stainless_sink_in_counter)
  )

  (:goal
    (and
      (isSliced lettuce_green_head_on_round_table_center)
      (isClean lettuce_green_head_on_round_table_center)
      (inReceptacle lettuce_green_head_on_round_table_center counter_by_sink)
    )
  )
)