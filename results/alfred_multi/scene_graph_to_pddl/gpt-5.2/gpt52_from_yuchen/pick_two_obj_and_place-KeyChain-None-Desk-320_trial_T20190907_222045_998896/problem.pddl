(define (problem move_two_keysets_dresser_to_white_table)
  (:domain put_task)
  (:objects
    robot - agent

    white_table_with_sun_pattern - receptacle
    wooden_dresser_top - receptacle

    blue_keys_set_left_on_dresser - object
    blue_keys_set_right_on_dresser - object
    checkerboard_board_on_dresser - object
    white_smartphone_on_dresser - object

    red_digital_alarm_clock - object
    black_smartphone_on_white_table - object
    yellow_pencil_left_on_white_table - object
    yellow_pencil_right_on_white_table - object
    small_pink_item_on_white_table - object
  )

  (:init
    ;; objects on / in receptacles
    (inReceptacle red_digital_alarm_clock white_table_with_sun_pattern)
    (inReceptacle black_smartphone_on_white_table white_table_with_sun_pattern)
    (inReceptacle yellow_pencil_left_on_white_table white_table_with_sun_pattern)
    (inReceptacle yellow_pencil_right_on_white_table white_table_with_sun_pattern)
    (inReceptacle small_pink_item_on_white_table white_table_with_sun_pattern)

    (inReceptacle checkerboard_board_on_dresser wooden_dresser_top)
    (inReceptacle blue_keys_set_left_on_dresser wooden_dresser_top)
    (inReceptacle white_smartphone_on_dresser wooden_dresser_top)
    (inReceptacle blue_keys_set_right_on_dresser wooden_dresser_top)
  )

  (:goal
    (and
      (inReceptacle blue_keys_set_left_on_dresser white_table_with_sun_pattern)
      (inReceptacle blue_keys_set_right_on_dresser white_table_with_sun_pattern)
    )
  )
)