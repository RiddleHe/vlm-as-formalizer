(define (problem put_task_chill_mug_on_rack)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_microwave_left_counter - microwave
    stainless_fridge_right - fridge
    sink_basin_right_counter - sink

    wooden_rack_shelf_unit - receptacle

    butter_knife_right_of_toaster - knife

    white_mug_on_coffee_machine_drip_tray - object
    black_coffee_machine_left_counter - object
    silver_toaster_on_counter - receptacle
    gray_plate_on_rack_middle_shelf - object
    green_sponge_on_rack_middle_shelf - object
    salt_shaker_left_on_rack_middle_shelf - object
    salt_shaker_right_on_rack_middle_shelf - object
    condiment_bottle_top_shelf_left - object
    condiment_bottle_top_shelf_right - object
  )

  (:init
    (openable black_microwave_left_counter)
    (openable stainless_fridge_right)

    (inReceptacle white_mug_on_coffee_machine_drip_tray black_coffee_machine_left_counter)
    (inReceptacle gray_plate_on_rack_middle_shelf wooden_rack_shelf_unit)
    (inReceptacle green_sponge_on_rack_middle_shelf wooden_rack_shelf_unit)
    (inReceptacle salt_shaker_left_on_rack_middle_shelf wooden_rack_shelf_unit)
    (inReceptacle salt_shaker_right_on_rack_middle_shelf wooden_rack_shelf_unit)
    (inReceptacle condiment_bottle_top_shelf_left wooden_rack_shelf_unit)
    (inReceptacle condiment_bottle_top_shelf_right wooden_rack_shelf_unit)
  )

  (:goal
    (and
      (isCool white_mug_on_coffee_machine_drip_tray)
      (inReceptacle white_mug_on_coffee_machine_drip_tray wooden_rack_shelf_unit)
    )
  )
)