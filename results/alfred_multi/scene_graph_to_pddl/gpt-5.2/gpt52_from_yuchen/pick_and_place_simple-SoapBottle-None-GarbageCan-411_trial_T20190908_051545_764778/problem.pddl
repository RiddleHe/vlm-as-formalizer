(define (problem put_pump_bottle_in_garbage_can)
  (:domain put_task)

  (:objects
    robot_agent - agent

    green_garbage_can_under_counter - receptacle
    white_bathtub_sink_basin - sink

    pink_soap_bar_on_counter - object
    pink_soap_bar_in_garbage_can - object
    gray_pump_bottle_on_toilet_tank - object
    purple_spray_bottle_1_on_toilet_tank - object
    purple_spray_bottle_2_on_toilet_tank - object
    toilet_paper_roll_on_toilet_tank - object
    red_toilet_plunger_on_floor - object
    white_toilet_brush_in_holder_on_floor - object
    small_gold_candle_on_bathtub_ledge - object
    tall_brown_cylinder_on_bathtub_ledge - object
  )

  (:init
    (inReceptacle pink_soap_bar_in_garbage_can green_garbage_can_under_counter)
  )

  (:goal
    (and
      (inReceptacle gray_pump_bottle_on_toilet_tank green_garbage_can_under_counter)
    )
  )
)