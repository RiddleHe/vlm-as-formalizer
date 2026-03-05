(define (problem warm_mug_put_in_cabinet)
  (:domain put_task)
  (:objects
    robot_agent - agent

    upper_wood_cabinet_above_sink - receptacle
    lower_wood_cabinet_under_sink - receptacle
    L_shape_lower_wood_cabinet_under_counter_left - receptacle
    double_basin_stainless_sink - sink

    blue_coffee_machine_left_counter - receptacle

    yellow_handle_knife_on_counter_in_front_of_sink - knife

    white_ceramic_mug_in_coffee_machine - object
    loaf_of_bread_on_counter - object
    silver_fork_on_counter_near_right_sink - object
    tall_copper_salt_pepper_grinder_1 - object
    tall_copper_salt_pepper_grinder_2 - object
    tall_copper_salt_pepper_grinder_3 - object
    tall_copper_salt_pepper_grinder_4 - object
    wine_glass_on_windowsill - object
  )

  (:init
    (openable upper_wood_cabinet_above_sink)
    (openable lower_wood_cabinet_under_sink)
    (openable L_shape_lower_wood_cabinet_under_counter_left)

    (inReceptacle white_ceramic_mug_in_coffee_machine blue_coffee_machine_left_counter)
  )

  (:goal
    (and
      (isHot white_ceramic_mug_in_coffee_machine)
      (inReceptacle white_ceramic_mug_in_coffee_machine upper_wood_cabinet_above_sink)
    )
  )
)