(define (problem put_two_pencils_on_desk)
  (:domain put_task)
  (:objects
    robot_agent - agent
    white_desk_surface_top_view - receptacle
    wooden_shelf_unit_lower_shelf - receptacle
    orange_pencil_on_lower_shelf_left - object
    metal_bowl_on_white_desk_left - object
    keyring_with_keys_on_white_desk_center - object
    compact_disc_on_lower_shelf_left_center - object
    small_gray_knife_on_lower_shelf_right - knife
    brown_basketball_right_edge - object
    blue_digital_clock_left_edge - object
  )

  (:init
    (inReceptacle metal_bowl_on_white_desk_left white_desk_surface_top_view)
    (inReceptacle keyring_with_keys_on_white_desk_center white_desk_surface_top_view)
    (inReceptacle compact_disc_on_lower_shelf_left_center wooden_shelf_unit_lower_shelf)
    (inReceptacle orange_pencil_on_lower_shelf_left wooden_shelf_unit_lower_shelf)
    (inReceptacle small_gray_knife_on_lower_shelf_right wooden_shelf_unit_lower_shelf)
  )

  (:goal
    (and
      (inReceptacle orange_pencil_on_lower_shelf_left white_desk_surface_top_view)
      (inReceptacle compact_disc_on_lower_shelf_left_center white_desk_surface_top_view)
    )
  )
)