(define (problem put_pot_with_sponge_on_table)
  (:domain put_task)

  (:objects
    robot_agent - agent

    white_kitchen_table_center - receptacle
    black_countertop_microwave_right_keypad - microwave

    copper_pot_front_left_burner - object
    copper_pot_back_right_burner - object
    white_stove_base_with_black_burners - object
    small_wooden_stool_right_of_table - object
    red_tomato_on_left_counter - object
    brown_egg_on_left_counter - object
    gray_knife_like_utensil_on_left_counter - object
  )

  (:init
    (openable black_countertop_microwave_right_keypad)
    ;; robot initially not at any object's location, and holds nothing
  )

  (:goal
    (and
      (inReceptacle copper_pot_front_left_burner white_kitchen_table_center)
    )
  )
)