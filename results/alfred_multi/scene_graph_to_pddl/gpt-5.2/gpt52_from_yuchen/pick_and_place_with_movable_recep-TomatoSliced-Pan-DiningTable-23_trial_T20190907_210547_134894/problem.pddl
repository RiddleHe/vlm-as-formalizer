(define (problem put_task_pan_tomato_slice_on_island)
  (:domain put_task)

  (:objects
    robot_agent - agent

    green_kitchen_island_countertop - receptacle
    black_square_pan_on_island - receptacle
    white_stove_oven_base - receptacle
    metal_square_pot_on_stove_right_burner - receptacle
    brown_grill_pan_on_stove_left_burner - receptacle

    metal_table_knife_on_island - knife

    clear_salt_shaker_on_island - object
    red_tomato_whole_on_island - object
    green_cabbage_head_left_on_island - object
    green_cabbage_head_right_on_island - object
    red_bell_pepper_on_island - object
    red_bell_pepper_piece_near_pan - object
    red_chopstick_like_stick_on_island - object
    white_egg_on_island - object
    ribbed_gray_oil_dispenser_on_island - object
    clear_glass_bottle_on_island - object
    dark_green_wine_bottle_1_on_island - object
    dark_green_wine_bottle_2_on_island - object
    dark_green_wine_bottle_3_on_island - object
    blue_pen_on_island - object
    red_pen_on_island - object
    white_spatula_on_island - object
    utensil_holder_left_of_stove - object
  )

  (:init
    ;; In-receptacle relations from scene graph
    (inReceptacle brown_grill_pan_on_stove_left_burner white_stove_oven_base)
    (inReceptacle metal_square_pot_on_stove_right_burner white_stove_oven_base)

    (inReceptacle black_square_pan_on_island green_kitchen_island_countertop)
    (inReceptacle metal_table_knife_on_island green_kitchen_island_countertop)
    (inReceptacle clear_salt_shaker_on_island green_kitchen_island_countertop)
    (inReceptacle red_tomato_whole_on_island green_kitchen_island_countertop)
    (inReceptacle green_cabbage_head_left_on_island green_kitchen_island_countertop)
    (inReceptacle green_cabbage_head_right_on_island green_kitchen_island_countertop)
    (inReceptacle red_bell_pepper_on_island green_kitchen_island_countertop)
    (inReceptacle red_bell_pepper_piece_near_pan green_kitchen_island_countertop)
    (inReceptacle red_chopstick_like_stick_on_island green_kitchen_island_countertop)
    (inReceptacle white_egg_on_island green_kitchen_island_countertop)
    (inReceptacle ribbed_gray_oil_dispenser_on_island green_kitchen_island_countertop)
    (inReceptacle clear_glass_bottle_on_island green_kitchen_island_countertop)
    (inReceptacle dark_green_wine_bottle_1_on_island green_kitchen_island_countertop)
    (inReceptacle dark_green_wine_bottle_2_on_island green_kitchen_island_countertop)
    (inReceptacle dark_green_wine_bottle_3_on_island green_kitchen_island_countertop)
    (inReceptacle blue_pen_on_island green_kitchen_island_countertop)
    (inReceptacle red_pen_on_island green_kitchen_island_countertop)
    (inReceptacle white_spatula_on_island green_kitchen_island_countertop)

    ;; Robot starts not holding anything; no atLocation facts initially (per instruction/scene graph)
  )

  (:goal
    (and
      ;; Place a pan onto the island (pan already on island, keep as goal condition)
      (inReceptacle black_square_pan_on_island green_kitchen_island_countertop)

      ;; Create a slice of tomato and place it into the pan
      (isSliced red_tomato_whole_on_island)
      (inReceptacle red_tomato_whole_on_island black_square_pan_on_island)
    )
  )
)