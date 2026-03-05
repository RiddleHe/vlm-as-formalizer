(define (problem put_task_heated_apple_left_of_sponge)
  (:domain put_task)

  (:objects
    robot_agent - agent

    silver_microwave_above_stove - microwave

    yellow_handle_knife_on_table_left - knife

    green_sponge_on_table_center - object
    red_apple_on_fork_right_center - object
    green_cabbage_on_table_back_center - object
    dark_wine_bottle_on_table_back_left - object
    round_brown_bread_loaf_on_table_back_left - object
    small_red_potato_on_table_back_left - object
    metal_spatula_on_sponge_center - object
    red_pencil_in_front_of_sponge - object
    metal_fork_left_of_sponge - object
    metal_spoon_left_front - object
    metal_knife_left_front - object
    brown_plate_back_right - object
    brown_ridged_pan_right - object
    brown_pan_handle_right - object
  )

  (:init
    (openable silver_microwave_above_stove)
    ;; robot initially not at any object's location, and holds nothing
  )

  (:goal
    (and
      (isHot red_apple_on_fork_right_center)
      (atLocation robot_agent red_apple_on_fork_right_center)
      (atLocation robot_agent green_sponge_on_table_center)
    )
  )
)