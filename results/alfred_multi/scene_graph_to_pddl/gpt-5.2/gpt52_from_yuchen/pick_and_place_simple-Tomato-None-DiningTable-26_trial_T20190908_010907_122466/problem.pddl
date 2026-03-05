(define (problem put_tomato_on_table)
  (:domain put_task)
  (:objects
    robot_agent - agent
    tall_white_fridge_right - fridge
    white_table_with_metal_legs - receptacle
    small_red_tomato_on_table - object
    brown_loaf_of_bread_on_table - object
    metal_spatula_on_table - object
    black_cylinder_cup_on_table - object
    tall_purple_rectangular_box_on_table - object
    gray_block_container_left_on_table - object
  )
  (:init
    (openable tall_white_fridge_right)

    (inReceptacle brown_loaf_of_bread_on_table white_table_with_metal_legs)
    (inReceptacle small_red_tomato_on_table white_table_with_metal_legs)
    (inReceptacle metal_spatula_on_table white_table_with_metal_legs)
    (inReceptacle black_cylinder_cup_on_table white_table_with_metal_legs)
    (inReceptacle tall_purple_rectangular_box_on_table white_table_with_metal_legs)
    (inReceptacle gray_block_container_left_on_table white_table_with_metal_legs)
  )
  (:goal
    (and
      (inReceptacle small_red_tomato_on_table white_table_with_metal_legs)
    )
  )
)