(define (problem put_clock_on_desk)
  (:domain put_task)
  (:objects
    robot - agent

    wooden_desk_surface_receptacle - receptacle
    wooden_upper_hutch_shelf_receptacle - receptacle

    gray_square_analog_clock - object
    black_screen_monitor_like_object - object
    silver_black_table_lamp - object
    shiny_compact_disc - object
    black_white_smartphone - object
    black_chair - object
  )

  (:init
    ;; initial object placements
    (inReceptacle gray_square_analog_clock wooden_desk_surface_receptacle)
    (inReceptacle shiny_compact_disc wooden_desk_surface_receptacle)
    (inReceptacle black_white_smartphone wooden_desk_surface_receptacle)
    (inReceptacle black_screen_monitor_like_object wooden_upper_hutch_shelf_receptacle)
    (inReceptacle silver_black_table_lamp wooden_upper_hutch_shelf_receptacle)

    ;; robot initially holds nothing and is not at any location (no atLocation facts)
  )

  (:goal
    (and
      (inReceptacle gray_square_analog_clock wooden_desk_surface_receptacle)
    )
  )
)