(define (problem put_glass_and_knife_onto_kitchen_shelf)
  (:domain put_task)
  (:objects
    robot - agent

    kitchen_shelf_gray_two_tier - receptacle

    knife_with_dark_handle_on_right_of_shelf - knife
    loaf_of_bread_left_on_top_shelf - object
    soap_pump_bottle_center_on_top_shelf - object
    egg_shaped_object_right_on_top_shelf - object
    blue_handle_tool_hanging_below_shelf - object
  )

  (:init
    (inReceptacle loaf_of_bread_left_on_top_shelf kitchen_shelf_gray_two_tier)
    (inReceptacle soap_pump_bottle_center_on_top_shelf kitchen_shelf_gray_two_tier)
    (inReceptacle knife_with_dark_handle_on_right_of_shelf kitchen_shelf_gray_two_tier)
    (inReceptacle egg_shaped_object_right_on_top_shelf kitchen_shelf_gray_two_tier)
    (inReceptacle blue_handle_tool_hanging_below_shelf kitchen_shelf_gray_two_tier)
  )

  (:goal
    (and
      (inReceptacle knife_with_dark_handle_on_right_of_shelf kitchen_shelf_gray_two_tier)
    )
  )
)