(define (problem put_soap_on_steel_rack)
  (:domain put_task)
  (:objects
    robot - agent
    gray_rectangular_bathroom_sink - sink
    steel_wire_rack_cart - receptacle
    blue_hex_trash_bin - receptacle
    pink_soap_bar_in_sink - object
    beige_soap_bar_on_rack_lower_shelf - object
    brown_cylindrical_handle_on_rack - object
    copper_candle_on_toilet_tank - object
    dark_wall_toilet_paper_holder - object
  )
  (:init
    (inReceptacle pink_soap_bar_in_sink gray_rectangular_bathroom_sink)
    (inReceptacle beige_soap_bar_on_rack_lower_shelf steel_wire_rack_cart)
  )
  (:goal
    (and
      (inReceptacle pink_soap_bar_in_sink steel_wire_rack_cart)
      (inReceptacle beige_soap_bar_on_rack_lower_shelf steel_wire_rack_cart)
    )
  )
)