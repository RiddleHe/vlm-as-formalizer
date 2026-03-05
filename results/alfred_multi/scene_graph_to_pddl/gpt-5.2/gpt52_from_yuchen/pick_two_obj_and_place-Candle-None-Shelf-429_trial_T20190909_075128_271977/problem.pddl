(define (problem put_two_candles_on_shelf)
  (:domain put_task)
  (:objects
    agent_robot - agent

    receptacle_black_hexagon_bin_on_floor - receptacle
    receptacle_white_shelf_ledge_left - receptacle
    receptacle_wall_shelf_right - receptacle

    object_left_candle_1_on_left_shelf - object
    object_left_candle_2_on_left_shelf - object
    object_left_candle_3_on_left_shelf - object
    object_toilet_paper_roll_on_left_shelf - object
    object_tissue_box_on_right_shelf - object
    object_green_plunger_on_floor_right - object
    object_toilet - object
    object_shower_curtain - object
    object_window - object
    object_door - object
  )

  (:init
    ;; agent location (as given by scene graph)
    (atLocation agent_robot receptacle_white_shelf_ledge_left)

    ;; object placements (as given by scene graph)
    (inReceptacle object_left_candle_1_on_left_shelf receptacle_white_shelf_ledge_left)
    (inReceptacle object_left_candle_2_on_left_shelf receptacle_white_shelf_ledge_left)
    (inReceptacle object_left_candle_3_on_left_shelf receptacle_white_shelf_ledge_left)
    (inReceptacle object_toilet_paper_roll_on_left_shelf receptacle_white_shelf_ledge_left)
    (inReceptacle object_tissue_box_on_right_shelf receptacle_wall_shelf_right)
  )

  (:goal
    (and
      ;; Put two candles on a shelf (use the right wall shelf as the target shelf)
      (inReceptacle object_left_candle_1_on_left_shelf receptacle_wall_shelf_right)
      (inReceptacle object_left_candle_2_on_left_shelf receptacle_wall_shelf_right)
    )
  )
)