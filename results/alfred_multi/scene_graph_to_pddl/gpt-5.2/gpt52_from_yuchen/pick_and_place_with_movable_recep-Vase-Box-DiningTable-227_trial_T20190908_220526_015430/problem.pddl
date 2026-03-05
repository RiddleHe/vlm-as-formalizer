(define (problem put_task_box_plate_on_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_window_microwave_right_wall - microwave

    open_brown_cardboard_box_on_white_counter_left - receptacle
    white_dining_table_center - receptacle
    white_counter_under_window_right - receptacle
    white_counter_under_microwave_left - receptacle

    round_gray_plate_on_table_right - object
    gold_trophy_statue_on_table_left - object
    folded_newspaper_on_table_center - object

    small_metal_keys_like_object_on_table_left - knife
  )

  (:init
    (openable black_window_microwave_right_wall)

    (inReceptacle round_gray_plate_on_table_right white_dining_table_center)
    (inReceptacle gold_trophy_statue_on_table_left white_dining_table_center)
    (inReceptacle folded_newspaper_on_table_center white_dining_table_center)
  )

  (:goal
    (and
      (inReceptacle round_gray_plate_on_table_right open_brown_cardboard_box_on_white_counter_left)
      (inReceptacle open_brown_cardboard_box_on_white_counter_left white_dining_table_center)
    )
  )
)