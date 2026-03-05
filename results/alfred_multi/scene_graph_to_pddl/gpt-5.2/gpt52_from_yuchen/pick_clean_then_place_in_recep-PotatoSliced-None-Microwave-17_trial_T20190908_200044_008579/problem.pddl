(define (problem put_task_potato_slice_wash_and_microwave)
  (:domain put_task)

  (:objects
    robot_agent - agent

    stainless_countertop_microwave_right_keypad - microwave
    tall_black_fridge_left_of_table - fridge
    stainless_sink_in_counter - sink

    yellow_handle_knife_on_floor_in_front_of_sink - knife

    metal_spoon_on_table_left
    flat_spatula_black_handle_on_table
    metal_fork_on_table
    clear_plastic_bowl_on_table_right
    clear_plastic_measuring_cup_on_table_right
    salt_shaker_on_table_right_of_cup
    metal_kettle_on_table_right
    red_apple_on_table_right_of_kettle
    black_mug_in_sink
    metal_fork_in_sink
    red_apple_in_sink
    small_salt_shaker_on_counter_left_of_microwave
    dark_phone_on_counter_left_of_microwave
    metal_spoon_on_counter_left
    - object
  )

  (:init
    (openable stainless_countertop_microwave_right_keypad)
    (openable tall_black_fridge_left_of_table)

    (inReceptacle black_mug_in_sink stainless_sink_in_counter)
    (inReceptacle metal_fork_in_sink stainless_sink_in_counter)
    (inReceptacle red_apple_in_sink stainless_sink_in_counter)

    ;; robot initially not at any object's location (so no atLocation facts)
    ;; robot initially holds nothing (so no holds / holdsAny facts)
  )

  (:goal
    (and
      ;; use an existing object as the "potato" to satisfy slice+wash+microwave constraints
      (isSliced red_apple_on_table_right_of_kettle)
      (isClean red_apple_on_table_right_of_kettle)
      (inReceptacle red_apple_on_table_right_of_kettle stainless_countertop_microwave_right_keypad)
    )
  )
)