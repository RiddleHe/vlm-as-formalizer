(define (problem put_task_lettuce_chill_on_table)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_microwave_on_right_side_of_table - microwave
    tall_gray_fridge_in_center_view - fridge

    white_table_with_metal_legs - receptacle
    black_round_tray_under_mug - receptacle

    green_head_of_lettuce_left_on_table - object
    green_head_of_lettuce_right_on_table - object
    green_head_of_lettuce_top_right - object
    clear_salt_shaker_left - object
    clear_salt_shaker_middle - object
    clear_salt_shaker_right - object
    green_rectangular_sponge_left - object
    metal_spoon_left - object
    metal_spoon_right - object
    tall_clear_bottle_with_yellow_liquid_center - object
    beige_mug_on_tray - object
    clear_wine_glass_center - object
    clear_wine_glass_right - object
    white_funnel_like_object_left - object
  )

  (:init
    (openable black_microwave_on_right_side_of_table)
    (openable tall_gray_fridge_in_center_view)

    (inReceptacle beige_mug_on_tray black_round_tray_under_mug)
  )

  (:goal
    (and
      (isCool green_head_of_lettuce_left_on_table)
      (inReceptacle green_head_of_lettuce_left_on_table white_table_with_metal_legs)
    )
  )
)