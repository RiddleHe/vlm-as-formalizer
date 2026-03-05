(define (problem put_clean_knife_in_cabinet_drawer)
  (:domain put_task)

  (:objects
    robot - agent

    sink_basin_left_counter - sink
    cabinet_drawers_white_under_counter - receptacle

    knife_gray_handle_on_island_counter - knife

    bread_loaf_brown_on_island_counter - object
    cup_brown_on_island_counter - object
    spoon_metal_on_island_counter - object
    apple_yellow_on_island_counter - object
    phone_black_on_island_counter - object
    lettuce_green_on_island_counter - object
    fork_metal_on_counter_by_plant - object
    tomato_red_on_counter_by_plant - object
    tray_black_on_right_counter - object
    spatula_gray_in_sink - object
    spoon_metal_in_sink - object
  )

  (:init
    ;; receptacle properties
    (openable cabinet_drawers_white_under_counter)

    ;; objects currently in receptacles
    (inReceptacle spatula_gray_in_sink sink_basin_left_counter)
    (inReceptacle spoon_metal_in_sink sink_basin_left_counter)

    ;; robot initially not at any location and holding nothing
  )

  (:goal
    (and
      (isClean knife_gray_handle_on_island_counter)
      (inReceptacle knife_gray_handle_on_island_counter cabinet_drawers_white_under_counter)
    )
  )
)