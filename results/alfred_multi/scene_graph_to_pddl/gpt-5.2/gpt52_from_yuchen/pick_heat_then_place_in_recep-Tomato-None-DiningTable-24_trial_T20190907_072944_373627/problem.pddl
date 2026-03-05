(define (problem put_task_heat_tomato_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_with_red_trim_and_right_dial_panel - microwave
    double_basin_sink_with_two_faucets - sink
    white_table_with_metal_legs - receptacle
    wooden_countertop_with_drawers - receptacle
    yellow_trash_can_left_of_counter - receptacle

    black_handle_knife_on_table_left - knife
    black_handle_knife_on_table_right - knife

    red_tomato_on_counter_edge - object
    dark_round_pan_or_plate_on_counter - object
    small_yellow_fruit_on_counter - object
    clear_salt_shaker_on_counter - object
    green_cabbage_on_table_left - object
    green_sponge_on_table - object
    metal_fork_on_counter - object
    metal_fork_on_table_center - object
    copper_mug_on_table - object
    soap_dispenser_on_table_right - object
    black_chair_under_table - object
  )

  (:init
    (openable microwave_with_red_trim_and_right_dial_panel)
  )

  (:goal
    (and
      (isHot red_tomato_on_counter_edge)
      (inReceptacle red_tomato_on_counter_edge white_table_with_metal_legs)
    )
  )
)