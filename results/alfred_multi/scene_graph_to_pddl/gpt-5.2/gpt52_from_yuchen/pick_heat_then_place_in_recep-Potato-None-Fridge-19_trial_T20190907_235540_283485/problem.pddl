(define (problem put_task_heated_potato_in_fridge)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_black_on_counter - microwave
    fridge_tall_black_double_door - fridge
    sink_left_of_counter - sink

    coffee_machine_brown_on_round_table - receptacle
    black_mug_on_coffee_machine_tray - receptacle
    round_wooden_table - receptacle
    gray_plate_on_table - receptacle

    potato_brown_left_on_table - object
    bread_loaf_dark_on_table - object
    tomato_red_top_right_on_table - object
    tomato_red_center_on_table - object
    tomato_red_bottom_left_on_table - object
    green_notebook_right_on_table - object
    green_notebook_left_on_table - object
    salt_shaker_clear_on_table - object
    metal_spatula_left_on_table - object
    metal_fork_on_table_near_door - object
    soap_dispenser_blue_next_to_microwave - object
  )

  (:init
    (openable microwave_black_on_counter)
    (openable fridge_tall_black_double_door)

    (inReceptacle black_mug_on_coffee_machine_tray coffee_machine_brown_on_round_table)
  )

  (:goal
    (and
      (inReceptacle potato_brown_left_on_table fridge_tall_black_double_door)
      (isHot potato_brown_left_on_table)
    )
  )
)