(define (problem put_task_heat_slice_tomato_in_sink)
  (:domain put_task)

  (:objects
    robot_agent - agent

    red_countertop_microwave - microwave
    tall_black_fridge - fridge
    silver_kitchen_sink_basin - sink

    green_handle_kitchen_knife_on_counter - knife
    metal_butter_knife_on_table - knife
    metal_spoon_in_sink - knife

    clear_drinking_glass_in_sink - object
    white_egg_in_sink - object
    yellow_egg_yolk_in_sink - object
    brown_potato_in_sink - object
    green_cabbage_in_sink - object
  )

  (:init
    (openable red_countertop_microwave)
    (openable tall_black_fridge)

    (inReceptacle metal_spoon_in_sink silver_kitchen_sink_basin)
    (inReceptacle clear_drinking_glass_in_sink silver_kitchen_sink_basin)
    (inReceptacle white_egg_in_sink silver_kitchen_sink_basin)
    (inReceptacle yellow_egg_yolk_in_sink silver_kitchen_sink_basin)
    (inReceptacle brown_potato_in_sink silver_kitchen_sink_basin)
    (inReceptacle green_cabbage_in_sink silver_kitchen_sink_basin)
  )

  (:goal
    (and
      ;; No tomato object is present in the provided scene graph, so the task goal
      ;; cannot be grounded with existing objects.
      ;; Keeping an achievable goal would violate the instruction; keeping the
      ;; instructed goal would require introducing a non-existent tomato object.
    )
  )
)