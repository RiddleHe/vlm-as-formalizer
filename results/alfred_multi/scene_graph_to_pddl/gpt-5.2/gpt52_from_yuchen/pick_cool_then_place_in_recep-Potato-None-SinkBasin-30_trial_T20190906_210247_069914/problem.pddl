(define (problem put_task_cold_brown_ball_in_sink)
  (:domain put_task)
  (:objects
    robot - agent

    fridge_black_with_magnets - fridge
    sink_white_basins_in_counter - sink
    recycling_bin_blue_octagon - receptacle

    knife_beige_handle_right - knife
    knife_beige_handle_far_right - knife

    copper_bowl_in_sink - object
    bottle_silver_with_brown_cap_on_counter - object
    fork_metal_on_counter - object
    sponge_green_on_counter - object
    plant_potted_white_on_counter - object
    watermelont_picture_magnet - object
    photo_magnet_with_smiley - object
    fridge_dispenser_panel - object
    brown_ball_in_recycling_bin - object
  )

  (:init
    (openable fridge_black_with_magnets)

    (isCool brown_ball_in_recycling_bin)

    (inReceptacle copper_bowl_in_sink sink_white_basins_in_counter)
    (inReceptacle brown_ball_in_recycling_bin recycling_bin_blue_octagon)
  )

  (:goal
    (and
      (inReceptacle brown_ball_in_recycling_bin sink_white_basins_in_counter)
      (isCool brown_ball_in_recycling_bin)
    )
  )
)