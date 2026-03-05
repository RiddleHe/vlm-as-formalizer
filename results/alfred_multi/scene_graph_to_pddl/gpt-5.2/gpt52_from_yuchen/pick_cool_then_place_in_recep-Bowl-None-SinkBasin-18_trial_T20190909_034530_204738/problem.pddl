(define (problem put_task_chill_bowl_in_sink)
  (:domain put_task)

  (:objects
    robot_agent - agent

    double_basin_metal_sink - sink
    tall_white_fridge_right_side - fridge
    round_black_tabletop - receptacle

    black_bowl_on_table_left - object
    clear_plastic_cup_on_table - object
    red_tomato_on_table - object
    green_lettuce_head_front_right - object
    green_lettuce_head_back_right - object
    metal_fork_on_table_right - object
    metal_spoon_on_table_right - object
    salt_pepper_shaker_1 - object
    salt_pepper_shaker_2 - object
    salt_pepper_shaker_3 - object
    salt_pepper_shaker_4 - object
    soap_dispenser_1 - object
    soap_dispenser_2 - object
    potted_plant_orange_pot - object
    brown_egg_in_right_sink_basin - object
  )

  (:init
    (openable tall_white_fridge_right_side)

    (inReceptacle black_bowl_on_table_left round_black_tabletop)
    (inReceptacle clear_plastic_cup_on_table round_black_tabletop)
    (inReceptacle red_tomato_on_table round_black_tabletop)
    (inReceptacle green_lettuce_head_front_right round_black_tabletop)
    (inReceptacle green_lettuce_head_back_right round_black_tabletop)
    (inReceptacle metal_fork_on_table_right round_black_tabletop)
    (inReceptacle metal_spoon_on_table_right round_black_tabletop)
    (inReceptacle salt_pepper_shaker_1 round_black_tabletop)
    (inReceptacle salt_pepper_shaker_2 round_black_tabletop)
    (inReceptacle salt_pepper_shaker_3 round_black_tabletop)
    (inReceptacle salt_pepper_shaker_4 round_black_tabletop)
    (inReceptacle soap_dispenser_1 round_black_tabletop)
    (inReceptacle soap_dispenser_2 round_black_tabletop)
    (inReceptacle potted_plant_orange_pot round_black_tabletop)

    (inReceptacle brown_egg_in_right_sink_basin double_basin_metal_sink)
  )

  (:goal
    (and
      (isCool black_bowl_on_table_left)
      (inReceptacle black_bowl_on_table_left double_basin_metal_sink)
    )
  )
)