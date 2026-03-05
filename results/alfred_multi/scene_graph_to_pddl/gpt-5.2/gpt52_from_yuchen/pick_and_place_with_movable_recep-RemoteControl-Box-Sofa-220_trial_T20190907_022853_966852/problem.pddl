(define (problem put_box_with_remote_on_couch)
  (:domain put_task)
  (:objects
    robot_agent - agent

    open_cardboard_box_on_left_side_of_coffee_table - receptacle
    glass_top_coffee_table - receptacle
    green_grid_pattern_couch - receptacle
    tissue_box_center_on_table - receptacle

    green_cylindrical_candle_on_table - object
    left_tv_remote_on_table - object
    right_tv_remote_on_table - object
    blue_card_on_table - object
    gold_round_cushion_on_couch - object
  )

  (:init
    ;; receptacle state
    (opened open_cardboard_box_on_left_side_of_coffee_table)

    ;; robot starts not at any location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle left_tv_remote_on_table open_cardboard_box_on_left_side_of_coffee_table)
      (inReceptacle open_cardboard_box_on_left_side_of_coffee_table green_grid_pattern_couch)
    )
  )
)