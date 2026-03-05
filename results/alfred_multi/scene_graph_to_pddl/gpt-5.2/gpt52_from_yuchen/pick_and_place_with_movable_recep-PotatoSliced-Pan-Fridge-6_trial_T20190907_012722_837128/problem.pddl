(define (problem put_task_kitchen_scene)
  (:domain put_task)

  (:objects
    robot - agent

    microwave_silver_countertop_right - microwave
    fridge_black_front_smiley_magnet - fridge

    knife_metal_counter_next_to_stove - knife

    pan_black_green_handle_on_island - object
    pan_black_handle_on_island - object
    cup_black_on_island - object
    fork_metal_on_island - object
    salt_shaker_metal_on_island - object
    cabbage_green_on_counter - object
    bread_loaf_brown_on_counter - object
    egg_brown_on_counter - object
    tomato_red_in_trash_bin - object
    trash_bin_white_floor_next_to_counter - receptacle
  )

  (:init
    (openable microwave_silver_countertop_right)
    (openable fridge_black_front_smiley_magnet)

    (inReceptacle tomato_red_in_trash_bin trash_bin_white_floor_next_to_counter)
  )

  (:goal
    (and
      (inReceptacle pan_black_handle_on_island fridge_black_front_smiley_magnet)
      (inReceptacle knife_metal_counter_next_to_stove fridge_black_front_smiley_magnet)
      (isSliced egg_brown_on_counter)
      (isHot egg_brown_on_counter)
      (inReceptacle egg_brown_on_counter fridge_black_front_smiley_magnet)
    )
  )
)