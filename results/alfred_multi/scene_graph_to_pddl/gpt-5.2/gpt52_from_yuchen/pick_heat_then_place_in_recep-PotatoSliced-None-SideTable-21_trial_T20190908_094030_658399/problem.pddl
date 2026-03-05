(define (problem put_task_problem_potato_slice_heat)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_microwave_on_white_table - microwave
    white_fridge_right_of_black_table - fridge
    white_sink_basins_right_edge - sink

    white_table_with_bread_and_pump_bottle - receptacle
    black_side_table - receptacle
    tall_black_vase_on_fridge_counter - receptacle

    silver_knife_on_black_table - knife

    brown_potato_on_black_table - object
    salt_shaker_on_black_table - object
    brown_bread_loaf_on_white_table - object
    green_lettuce_on_white_table - object
    brown_egg_on_white_table - object
    white_pump_bottle_on_white_table - object
    clear_cup_on_black_table - object
    yellow_apple_on_black_table - object
    red_apple_on_black_table - object
    red_apple_on_fridge_counter - object
  )

  (:init
    (openable black_microwave_on_white_table)
    (openable white_fridge_right_of_black_table)

    (inReceptacle brown_bread_loaf_on_white_table white_table_with_bread_and_pump_bottle)
    (inReceptacle green_lettuce_on_white_table white_table_with_bread_and_pump_bottle)
    (inReceptacle brown_egg_on_white_table white_table_with_bread_and_pump_bottle)
    (inReceptacle white_pump_bottle_on_white_table white_table_with_bread_and_pump_bottle)

    (inReceptacle clear_cup_on_black_table black_side_table)
    (inReceptacle yellow_apple_on_black_table black_side_table)
    (inReceptacle red_apple_on_black_table black_side_table)
    (inReceptacle silver_knife_on_black_table black_side_table)
    (inReceptacle brown_potato_on_black_table black_side_table)
    (inReceptacle salt_shaker_on_black_table black_side_table)

    (inReceptacle tall_black_vase_on_fridge_counter white_fridge_right_of_black_table)
    (inReceptacle red_apple_on_fridge_counter white_fridge_right_of_black_table)
  )

  (:goal
    (and
      (isSliced brown_potato_on_black_table)
      (isHot brown_potato_on_black_table)
      (inReceptacle brown_potato_on_black_table black_side_table)
    )
  )
)