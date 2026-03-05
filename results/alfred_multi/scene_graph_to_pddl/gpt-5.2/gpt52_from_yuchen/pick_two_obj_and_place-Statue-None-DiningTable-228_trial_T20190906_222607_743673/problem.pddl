(define (problem put_task_statues_on_table)
  (:domain put_task)

  (:objects
    robot_agent - agent

    dark_wood_coffee_table - receptacle
    round_table_with_white_lace_tablecloth - receptacle
    black_square_side_table_by_red_wall - receptacle

    bronze_statue_left_on_coffee_table - object
    bronze_statue_center_on_coffee_table - object
    bronze_statue_right_on_coffee_table - object
    tv_remote_on_coffee_table - object
    small_round_object_on_coffee_table - object
    square_glass_coaster_on_coffee_table - object
    tv_remote_on_round_table - object
    newspaper_on_round_table - object
    blue_card_left_on_round_table - object
    blue_card_right_on_round_table - object
  )

  (:init
    (inReceptacle bronze_statue_left_on_coffee_table dark_wood_coffee_table)
    (inReceptacle bronze_statue_center_on_coffee_table dark_wood_coffee_table)
    (inReceptacle bronze_statue_right_on_coffee_table dark_wood_coffee_table)
    (inReceptacle tv_remote_on_coffee_table dark_wood_coffee_table)
    (inReceptacle small_round_object_on_coffee_table dark_wood_coffee_table)
    (inReceptacle square_glass_coaster_on_coffee_table dark_wood_coffee_table)

    (inReceptacle tv_remote_on_round_table round_table_with_white_lace_tablecloth)
    (inReceptacle newspaper_on_round_table round_table_with_white_lace_tablecloth)
    (inReceptacle blue_card_left_on_round_table round_table_with_white_lace_tablecloth)
    (inReceptacle blue_card_right_on_round_table round_table_with_white_lace_tablecloth)
  )

  (:goal
    (and
      (inReceptacle bronze_statue_left_on_coffee_table dark_wood_coffee_table)
      (inReceptacle bronze_statue_center_on_coffee_table dark_wood_coffee_table)
    )
  )
)