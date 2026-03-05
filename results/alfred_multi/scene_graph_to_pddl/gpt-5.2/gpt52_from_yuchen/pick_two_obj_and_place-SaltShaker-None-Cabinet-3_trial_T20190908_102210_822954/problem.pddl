(define (problem put_task_salt_shakers_to_lower_cabinet)
  (:domain put_task)
  (:objects
    robot_agent - agent

    lower_cabinet_doors_under_left_counter - receptacle
    tall_black_fridge_right_side - fridge
    stainless_sink_left_counter - sink

    salt_shaker_left_on_spice_shelf - object
    salt_shaker_right_on_spice_shelf - object
    clear_vinegar_bottle_on_spice_shelf - object
    red_tomato_on_left_counter - object
    metal_kettle_on_stovetop - object
    black_pot_left_edge_counter - object
    hanging_ladle_black_handle - object
    hanging_spatula_blue_handle - object
    hanging_spatula_white_handle - object
    hanging_spoon_black_handle - object
    hanging_tool_red_handle - object
    hanging_tool_orange_handle - object
    black_pan_on_right_burner - object
    green_vegetable_on_counter - object
    wooden_block_on_counter - object
  )

  (:init
    (openable tall_black_fridge_right_side)
    (openable lower_cabinet_doors_under_left_counter)

    (inReceptacle salt_shaker_left_on_spice_shelf lower_cabinet_doors_under_left_counter)
    (inReceptacle salt_shaker_right_on_spice_shelf lower_cabinet_doors_under_left_counter)
    (inReceptacle clear_vinegar_bottle_on_spice_shelf lower_cabinet_doors_under_left_counter)
  )

  (:goal
    (and
      (inReceptacle salt_shaker_left_on_spice_shelf lower_cabinet_doors_under_left_counter)
      (inReceptacle salt_shaker_right_on_spice_shelf lower_cabinet_doors_under_left_counter)
    )
  )
)