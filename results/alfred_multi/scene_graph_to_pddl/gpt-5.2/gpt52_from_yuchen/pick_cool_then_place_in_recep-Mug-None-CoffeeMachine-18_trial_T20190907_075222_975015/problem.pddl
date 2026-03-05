(define (problem cool-cup-coffee-maker)
  (:domain put_task)
  (:objects
    robot - agent
    coffee_maker_machine_on_counter - object
    white_cup_on_coffee_maker_drip_tray - object
    two_copper_hanging_utensils_left - object
    white_countertop_surface - object
    wooden_cabinet_edge_bottom_right - object
    dark_horizontal_rail_under_cabinet - object
    two_dark_vertical_handles_upper_cabinet - object
  )

  (:init
    ;; No initial atLocation facts: robot starts not at any object's location.
  )

  (:goal
    (and
      (isCool white_cup_on_coffee_maker_drip_tray)
    )
  )
)