(define (problem puttask_clean_apple_in_fridge)
  (:domain put_task)
  (:objects
    robot_agent - agent
    red_countertop_microwave_right_keypad - microwave
    black_fridge_large_left - fridge
    double_basin_metal_sink - sink
    yellow_apple_on_left_table - object
    brown_egg_in_right_sink_basin - object
    clear_glass_cup_in_left_sink_basin - object
    metal_bowl_in_right_sink_basin - object
  )
  (:init
    (openable red_countertop_microwave_right_keypad)
    (openable black_fridge_large_left)

    (inReceptacle clear_glass_cup_in_left_sink_basin double_basin_metal_sink)
    (inReceptacle brown_egg_in_right_sink_basin double_basin_metal_sink)
    (inReceptacle metal_bowl_in_right_sink_basin double_basin_metal_sink)
    (inReceptacle yellow_apple_on_left_table red_countertop_microwave_right_keypad)
  )
  (:goal
    (and
      (isClean yellow_apple_on_left_table)
      (inReceptacle yellow_apple_on_left_table black_fridge_large_left)
    )
  )
)