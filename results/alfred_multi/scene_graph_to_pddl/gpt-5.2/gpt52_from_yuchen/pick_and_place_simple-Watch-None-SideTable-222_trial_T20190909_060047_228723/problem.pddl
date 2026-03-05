(define (problem move_watch_to_small_wooden_table)
  (:domain put_task)
  (:objects
    robot - agent

    small_wooden_side_table_with_drawer - receptacle
    long_low_wooden_tv_console - receptacle

    folded_newspaper_on_side_table - object
    flat_screen_tv_on_tv_console - object
    bronze_statue_on_tv_console_left - object
    green_credit_card_on_tv_console - object
    gray_remote_control_on_tv_console_right - object
    black_watch_on_tv_console_right_of_remote - object
    black_round_object_on_tv_console_left_of_card - object
    black_round_object_on_tv_console_right_of_card - object
    black_round_object_on_tv_console_left_of_remote - object
  )

  (:init
    (inReceptacle folded_newspaper_on_side_table small_wooden_side_table_with_drawer)
    (inReceptacle flat_screen_tv_on_tv_console long_low_wooden_tv_console)
    (inReceptacle bronze_statue_on_tv_console_left long_low_wooden_tv_console)
    (inReceptacle green_credit_card_on_tv_console long_low_wooden_tv_console)
    (inReceptacle gray_remote_control_on_tv_console_right long_low_wooden_tv_console)
    (inReceptacle black_watch_on_tv_console_right_of_remote long_low_wooden_tv_console)
    (inReceptacle black_round_object_on_tv_console_left_of_card long_low_wooden_tv_console)
    (inReceptacle black_round_object_on_tv_console_right_of_card long_low_wooden_tv_console)
    (inReceptacle black_round_object_on_tv_console_left_of_remote long_low_wooden_tv_console)
  )

  (:goal
    (and
      (inReceptacle black_watch_on_tv_console_right_of_remote small_wooden_side_table_with_drawer)
    )
  )
)