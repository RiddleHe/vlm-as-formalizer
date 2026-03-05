(define (problem chill_apple_put_in_white_bin)
  (:domain put_task)

  (:objects
    robot_agent - agent

    black_countertop_microwave_left - microwave
    black_double_door_fridge_front - fridge
    white_plastic_trash_bin_floor_left - receptacle

    red_apple_on_counter - object
    brown_egg_on_counter - object
    yellow_handle_knife_like_utensil_on_counter - object
    clear_salt_shaker_on_counter - object
    metal_spoon_on_counter - object
    metal_fork_on_counter - object
    blue_soap_dispenser_on_wall - object
  )

  (:init
    (openable black_countertop_microwave_left)
    (openable black_double_door_fridge_front)
    ;; robot starts not at any location; nothing is held; nothing is in any receptacle
  )

  (:goal
    (and
      (isCool red_apple_on_counter)
      (inReceptacle red_apple_on_counter white_plastic_trash_bin_floor_left)
    )
  )
)