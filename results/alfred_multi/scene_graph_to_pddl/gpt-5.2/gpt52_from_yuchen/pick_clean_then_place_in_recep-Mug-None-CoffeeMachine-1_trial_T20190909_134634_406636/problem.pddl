(define (problem wash_mug_put_in_coffee_maker)
  (:domain put_task)
  (:objects
    robot_agent - agent

    stainless_kitchen_sink_basin - sink
    blue_coffee_maker_machine - receptacle

    white_coffee_mug_on_coffee_maker_tray - object
    butter_knife_in_sink - knife
    clear_drinking_glass_in_sink - object
    speckled_gray_bowl_in_sink - object
    brown_potato_in_sink - object
    red_toaster_appliance - object
    metal_fork_on_counter_left - object
    green_wine_bottle_on_counter_left - object
    white_plate_on_left_counter - object
  )

  (:init
    ;; Robot initially not at any location and holds nothing (no atLocation/holds/holdsAny facts)

    ;; Receptacles that contain objects
    (inReceptacle clear_drinking_glass_in_sink stainless_kitchen_sink_basin)
    (inReceptacle brown_potato_in_sink stainless_kitchen_sink_basin)
    (inReceptacle butter_knife_in_sink stainless_kitchen_sink_basin)
    (inReceptacle speckled_gray_bowl_in_sink stainless_kitchen_sink_basin)
  )

  (:goal
    (and
      (isClean white_coffee_mug_on_coffee_maker_tray)
      (inReceptacle white_coffee_mug_on_coffee_maker_tray blue_coffee_maker_machine)
    )
  )
)