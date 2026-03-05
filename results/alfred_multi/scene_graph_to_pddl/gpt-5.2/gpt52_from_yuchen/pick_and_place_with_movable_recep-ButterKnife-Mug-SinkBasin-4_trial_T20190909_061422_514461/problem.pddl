(define (problem clean_and_put_mug_knife_in_sink)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_countertop_microwave_back_right - microwave
    white_fridge_left_of_counter - fridge
    double_basin_marble_sink_right - sink

    wooden_table_surface_center - receptacle
    gray_plate_back_right_on_table - receptacle
    gray_pan_left_on_table - receptacle
    black_toaster_back_on_table - receptacle
    black_microwave_tray_inside - receptacle
    marble_countertop_left - receptacle

    white_spatula_right_front_on_table - knife

    white_ceramic_mug_on_table - object
    white_ceramic_mug_on_counter_left - object
    metal_salt_shaker_on_table - object
    metal_salt_shaker_on_counter - object
    metal_spoon_left_front_on_table - object
    metal_tongs_front_on_table - object
    green_lettuce_head_back_left_on_table - object
    green_lettuce_leaf_right_on_table - object
    brown_potato_left_on_table - object
    brown_potato_back_left_on_table - object
    small_brown_egg_left_on_table - object
    rectangular_bread_loaf_center_on_table - object
  )

  (:init
    (openable black_countertop_microwave_back_right)
    (openable white_fridge_left_of_counter)

    (inReceptacle white_ceramic_mug_on_table wooden_table_surface_center)
    (inReceptacle metal_salt_shaker_on_table wooden_table_surface_center)
    (inReceptacle metal_spoon_left_front_on_table wooden_table_surface_center)
    (inReceptacle white_spatula_right_front_on_table wooden_table_surface_center)
    (inReceptacle metal_tongs_front_on_table wooden_table_surface_center)
    (inReceptacle green_lettuce_head_back_left_on_table wooden_table_surface_center)
    (inReceptacle green_lettuce_leaf_right_on_table wooden_table_surface_center)
    (inReceptacle brown_potato_left_on_table wooden_table_surface_center)
    (inReceptacle brown_potato_back_left_on_table wooden_table_surface_center)
    (inReceptacle small_brown_egg_left_on_table wooden_table_surface_center)
    (inReceptacle rectangular_bread_loaf_center_on_table wooden_table_surface_center)
    (inReceptacle gray_plate_back_right_on_table wooden_table_surface_center)
    (inReceptacle gray_pan_left_on_table wooden_table_surface_center)
    (inReceptacle black_toaster_back_on_table wooden_table_surface_center)

    (inReceptacle white_ceramic_mug_on_counter_left marble_countertop_left)
    (inReceptacle metal_salt_shaker_on_counter marble_countertop_left)
  )

  (:goal
    (and
      (isClean white_spatula_right_front_on_table)
      (isClean white_ceramic_mug_on_table)
      (inReceptacle white_spatula_right_front_on_table double_basin_marble_sink_right)
      (inReceptacle white_ceramic_mug_on_table double_basin_marble_sink_right)
    )
  )
)