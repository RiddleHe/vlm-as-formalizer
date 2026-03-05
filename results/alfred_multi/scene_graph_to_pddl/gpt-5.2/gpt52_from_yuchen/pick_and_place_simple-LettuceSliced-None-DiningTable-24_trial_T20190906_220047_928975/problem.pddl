(define (problem slice_lettuce_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    yellow_handle_kitchen_knife_on_table - knife

    black_coffee_machine_base_on_table - receptacle
    black_round_tray_under_mug - receptacle
    beige_ceramic_mug_on_tray - receptacle
    clear_wine_glass_right_side - receptacle

    green_lettuce_head_right_side_on_table - object
    red_tomato_left_side_on_table - object
    golden_brown_onion_left_side_on_table - object
    small_salt_shaker_near_tomato - object
    green_frying_pan_left_back_on_table - object
    small_pinkish_bottle_left_back_on_table - object
    tall_black_cylindrical_appliance_back_right_on_table - object
    red_apple_back_right_near_wall - object

    microwave - microwave
    fridge - fridge
    sink - sink
  )

  (:init
    ;; robot initially not at any location, and holds nothing
    ;; (no atLocation facts)
    ;; (no holds / holdsAny facts)

    ;; receptacle relations from scene graph
    (inReceptacle beige_ceramic_mug_on_tray black_round_tray_under_mug)
  )

  (:goal
    (and
      (isSliced green_lettuce_head_right_side_on_table)
    )
  )
)