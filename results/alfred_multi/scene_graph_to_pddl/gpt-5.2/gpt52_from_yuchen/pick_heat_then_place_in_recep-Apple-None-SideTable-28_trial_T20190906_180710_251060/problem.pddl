(define (problem put_task_warm_apple_on_table)
  (:domain put_task)
  (:objects
    robot - agent

    microwave_silver_over_stove - microwave
    black_side_table_left - receptacle
    white_table_right - receptacle

    red_apple_on_white_table - object
    metal_salt_shaker_on_white_table - object
    brown_frying_pan_on_white_table - object
    yellow_bottle_on_black_side_table - object
    spoon_with_red_handle_on_black_side_table - object
    gray_trivet_on_black_side_table - object
    black_pot_on_stove - object
    brown_pan_on_stove - object
  )

  (:init
    (openable microwave_silver_over_stove)

    (inReceptacle yellow_bottle_on_black_side_table black_side_table_left)
    (inReceptacle spoon_with_red_handle_on_black_side_table black_side_table_left)
    (inReceptacle gray_trivet_on_black_side_table black_side_table_left)

    (inReceptacle red_apple_on_white_table white_table_right)
    (inReceptacle metal_salt_shaker_on_white_table white_table_right)
    (inReceptacle brown_frying_pan_on_white_table white_table_right)
    (inReceptacle black_pot_on_stove white_table_right)
    (inReceptacle brown_pan_on_stove white_table_right)
  )

  (:goal
    (and
      (isHot red_apple_on_white_table)
      (inReceptacle red_apple_on_white_table white_table_right)
    )
  )
)