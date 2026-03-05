(define (problem put_two_spray_bottles_on_metal_rack)
  (:domain put_task)
  (:objects
    robot - agent

    metal_rolling_rack_with_horizontal_bars - receptacle
    blue_hexagonal_bucket_on_floor - receptacle
    white_toilet_bowl_and_tank - receptacle
    glass_shower_enclosure - receptacle

    yellow_spray_bottle_with_white_trigger_on_rack - object
    silver_pump_bottle_on_toilet_tank - object
    green_plunger_with_brown_handle - object
    copper_toilet_paper_holder_on_wall - object
    small_orange_rectangular_item_on_floor - object
  )

  (:init
    ;; Robot starts not at any location and holds nothing (no atLocation/holds/holdsAny facts).

    ;; Current containment relationships from the scene graph
    (inReceptacle yellow_spray_bottle_with_white_trigger_on_rack metal_rolling_rack_with_horizontal_bars)
  )

  (:goal
    (and
      (inReceptacle yellow_spray_bottle_with_white_trigger_on_rack metal_rolling_rack_with_horizontal_bars)
      (inReceptacle silver_pump_bottle_on_toilet_tank metal_rolling_rack_with_horizontal_bars)
    )
  )
)