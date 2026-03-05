(define (problem put_cardboard_box_on_green_chair)
  (:domain put_task)
  (:objects
    robot_agent - agent

    green_upholstered_chair_with_gray_arms - receptacle
    dark_wood_side_table_with_shelf - receptacle

    brown_cardboard_box_open_top - object
    stack_of_books_on_table - object
    pencil_on_shelf - object
    metallic_tool_set_on_shelf - object
  )

  (:init
    (inReceptacle stack_of_books_on_table dark_wood_side_table_with_shelf)
    (inReceptacle pencil_on_shelf dark_wood_side_table_with_shelf)
    (inReceptacle metallic_tool_set_on_shelf dark_wood_side_table_with_shelf)
    (inReceptacle brown_cardboard_box_open_top dark_wood_side_table_with_shelf)
  )

  (:goal
    (and
      (inReceptacle brown_cardboard_box_open_top green_upholstered_chair_with_gray_arms)
    )
  )
)