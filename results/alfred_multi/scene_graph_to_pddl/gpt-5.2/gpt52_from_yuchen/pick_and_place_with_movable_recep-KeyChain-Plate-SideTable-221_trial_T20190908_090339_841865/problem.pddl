(define (problem put_plate_keys_on_small_table)
  (:domain put_task)

  (:objects
    robot - agent

    small_white_console_table_with_two_drawers - receptacle
    large_white_dining_table - receptacle

    round_brown_plate_on_dining_table - object
    set_of_keys_with_black_fob_and_orange_keytag - object
    blue_green_card_on_console_table - object
    dark_brown_statue_on_console_table - object
    remote_control_on_dining_table - object
    dark_blue_mug_on_dining_table - object
    small_stacked_books_or_box_on_dining_table_left - object
    black_flat_screen_tv_on_right - object
    white_chair_bottom_left - object
    white_chair_bottom_right - object
    white_chair_top_left - object
    white_chair_top_right - object
  )

  (:init
    ;; robot starts not at any location and holds nothing

    ;; receptacle contents from scene graph
    (inReceptacle set_of_keys_with_black_fob_and_orange_keytag small_white_console_table_with_two_drawers)
    (inReceptacle blue_green_card_on_console_table small_white_console_table_with_two_drawers)
    (inReceptacle dark_brown_statue_on_console_table small_white_console_table_with_two_drawers)

    (inReceptacle round_brown_plate_on_dining_table large_white_dining_table)
    (inReceptacle remote_control_on_dining_table large_white_dining_table)
    (inReceptacle dark_blue_mug_on_dining_table large_white_dining_table)
    (inReceptacle small_stacked_books_or_box_on_dining_table_left large_white_dining_table)
  )

  (:goal
    (and
      ;; plate is on the small table (in the receptacle)
      (inReceptacle round_brown_plate_on_dining_table small_white_console_table_with_two_drawers)
      ;; keys are on the plate (modeled as keys being in the plate receptacle)
      (inReceptacle set_of_keys_with_black_fob_and_orange_keytag round_brown_plate_on_dining_table)
    )
  )
)