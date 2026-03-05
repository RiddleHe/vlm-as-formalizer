(define (problem put_task_chilled_bowl_on_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    green_kitchen_table - receptacle
    tall_black_fridge_front_view - fridge
    white_stove_with_burners_top - receptacle
    shiny_metal_trash_can_right_of_stove - receptacle

    metal_bowl_left_edge_of_table - object
    green_cabbage_on_table - object
    small_red_fruit_on_table - object
    brown_frying_pan_on_table_right - object
    wooden_utensil_on_table_right - object
    silver_rectangular_box_under_table_shelf - object
    black_pot_under_table_shelf - object
    small_white_cup_under_table_shelf - object
  )

  (:init
    (openable tall_black_fridge_front_view)
    (isCool metal_bowl_left_edge_of_table)
  )

  (:goal
    (and
      (inReceptacle metal_bowl_left_edge_of_table green_kitchen_table)
    )
  )
)