(define (problem put_wet_soap_in_white_cabinet)
  (:domain put_task)
  (:objects
    robot - agent

    dark_gray_rectangular_sink_basin_left - sink
    dark_gray_rectangular_sink_basin_right - sink

    white_under_sink_cabinet_left - receptacle
    white_under_sink_cabinet_right - receptacle

    pink_bar_soap - object
    brown_cylindrical_container_cup - object
    white_toilet - object
    gold_candle_holder - object
    purple_soap_dispenser_bottle - object
    white_toilet_paper_roll - object
  )

  (:init
    (openable white_under_sink_cabinet_left)
    (openable white_under_sink_cabinet_right)
  )

  (:goal
    (and
      (inReceptacle pink_bar_soap white_under_sink_cabinet_left)
    )
  )
)