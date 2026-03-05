(define (problem chill_pan_put_in_sink)
  (:domain put_task)

  (:objects
    robot_agent - agent

    white_curved_front_fridge_right_edge - fridge
    stainless_single_basin_sink_under_window - sink

    round_ridged_pan_on_counter_center - object
    white_handle_knife_on_left_counter - knife
    clear_glass_bottle_on_counter_back - object
    red_tomato_on_counter_back_right_of_bottle - object
    brown_kiwi_on_counter_near_tomato - object
    white_paper_towel_roll_on_counter_right - object
    red_apple_front_left_on_counter - object
    red_apple_front_center_on_counter - object
    red_apple_front_right_on_counter - object
    small_blue_card_on_left_counter - object
  )

  (:init
    ;; receptacle properties from scene graph
    (openable white_curved_front_fridge_right_edge)

    ;; robot initially holds nothing and is not at any location (no atLocation / holdsAny facts)
  )

  (:goal
    (and
      (isCool round_ridged_pan_on_counter_center)
      (inReceptacle round_ridged_pan_on_counter_center stainless_single_basin_sink_under_window)
    )
  )
)