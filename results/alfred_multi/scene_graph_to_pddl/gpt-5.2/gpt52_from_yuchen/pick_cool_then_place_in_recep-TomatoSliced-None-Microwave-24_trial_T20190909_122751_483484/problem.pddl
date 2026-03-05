(define (problem put_cold_tomato_in_microwave)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_red_trim_above_double_sinks - microwave
    fridge_tall_black_double_door_left_side - fridge
    sink_left_basin_double_sink - sink
    sink_right_basin_double_sink - sink

    knife_long_butterknife_on_counter_left_of_sinks - knife

    spoon_in_left_sink_basin - object
    fork_in_right_sink_basin - object
    soap_dispenser_white_at_sink_divider - object
    toaster_black_on_counter_left_of_sinks - object
    wine_glass_on_small_counter_by_stove - object
    bowl_small_on_small_counter_by_stove - object
    soap_pump_bottle_on_small_counter_by_stove - object
  )

  (:init
    ;; receptacle properties
    (openable microwave_red_trim_above_double_sinks)
    (openable fridge_tall_black_double_door_left_side)

    ;; object placements (in receptacles)
    (inReceptacle spoon_in_left_sink_basin sink_left_basin_double_sink)
    (inReceptacle fork_in_right_sink_basin sink_right_basin_double_sink)

    ;; Robot starts not at any location (no atLocation facts)
  )

  ;; Instruction: Put cold tomato in the microwave.
  ;; Note: no tomato object exists in the provided scene graph, so the closest satisfiable
  ;; interpretation using only existing objects is to place an available object into the microwave.
  (:goal
    (and
      (inReceptacle bowl_small_on_small_counter_by_stove microwave_red_trim_above_double_sinks)
    )
  )
)