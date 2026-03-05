(define (problem put_task_kitchen_island_cup_fork)
  (:domain put_task)

  (:objects
    robot - agent

    black_refrigerator_left_of_sink - fridge
    silver_sink_in_green_counter - sink

    green_kitchen_island_countertop - receptacle
    green_left_countertop_by_stove - receptacle

    metal_knife_on_kitchen_island_right_of_melon - knife

    red_coffee_machine_on_left_counter - object
    two_green_cabbages_on_left_counter_near_stove - object
    two_square_metal_pans_on_stove_burners - object
    silver_trash_can_right_of_stove - object
    metal_spoon_in_sink - object
    metal_funnel_in_sink - object
    small_round_dish_in_sink - object
    white_sponge_in_sink - object
    two_black_bowls_on_kitchen_island_left - object
    striped_soap_dispenser_on_kitchen_island_center - object
    metal_fork_near_front_left_on_kitchen_island - object
    metal_fork_left_side_on_kitchen_island - object
    metal_fork_near_front_center_on_kitchen_island - object
    red_pencil_on_kitchen_island_front_right - object
    green_melon_on_kitchen_island_right - object
    brown_pot_on_kitchen_island_far_right - object
    brown_round_item_on_kitchen_island_back_right - object
  )

  (:init
    (openable black_refrigerator_left_of_sink)

    (inReceptacle metal_spoon_in_sink silver_sink_in_green_counter)
    (inReceptacle metal_funnel_in_sink silver_sink_in_green_counter)
    (inReceptacle small_round_dish_in_sink silver_sink_in_green_counter)
    (inReceptacle white_sponge_in_sink silver_sink_in_green_counter)
  )

  ;; Note: The instruction mentions a "cup", but no cup object/receptacle exists in the provided scene graph.
  (:goal
    (and
      (inReceptacle metal_fork_near_front_left_on_kitchen_island green_kitchen_island_countertop)
    )
  )
)