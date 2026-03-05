(define (problem chill_apple_put_on_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    tall_black_fridge_right - fridge

    yellow_apple_on_white_table - object
    white_table - object
    silver_knife_on_white_table_right - knife

    black_toaster_on_counter - object
    dark_green_bottle_on_counter - object
    small_round_brown_item_on_counter - object
    clear_drinking_glass_on_white_table - object
    white_plate_with_colored_rim_on_white_table - object
    red_tomato_left_on_white_table - object
    red_tomato_center_on_white_table - object
    red_tomato_right_on_white_table - object
    green_lettuce_on_white_table - object
    copper_salt_shaker_left_on_white_table - object
    copper_salt_shaker_center_on_white_table - object
    copper_salt_shaker_right_on_white_table - object
    wall_mounted_soap_dispenser_above_table - object
  )

  (:init
    (openable tall_black_fridge_right)
    (not (opened tall_black_fridge_right))
    (not (holdsAny robot_agent))
  )

  (:goal
    (and
      (isCool yellow_apple_on_white_table)
      (inReceptacle yellow_apple_on_white_table white_table)
    )
  )
)