(define (problem put_task_clean_egg_on_counter)
  (:domain put_task)
  (:objects
    agent_robot - agent

    microwave_black_countertop_right - microwave
    sink_white_basins_left - sink
    counter_brown_marble_surface - receptacle

    green_sponge_rectangular_by_sink - object
    white_planter_with_green_plant_on_wood_stand - object
    brown_paper_bag_loaf_shape_right_of_plant - object
    black_mug_right_edge - object
    metal_kettle_in_sink - object
    egg_light_brown_inside_microwave - object
    egg_orange_inside_microwave - object
  )

  (:init
    (openable microwave_black_countertop_right)

    ;; objects in receptacles
    (inReceptacle green_sponge_rectangular_by_sink counter_brown_marble_surface)
    (inReceptacle white_planter_with_green_plant_on_wood_stand counter_brown_marble_surface)
    (inReceptacle brown_paper_bag_loaf_shape_right_of_plant counter_brown_marble_surface)
    (inReceptacle black_mug_right_edge counter_brown_marble_surface)
    (inReceptacle microwave_black_countertop_right counter_brown_marble_surface)
    (inReceptacle metal_kettle_in_sink sink_white_basins_left)
    (inReceptacle egg_light_brown_inside_microwave microwave_black_countertop_right)
    (inReceptacle egg_orange_inside_microwave microwave_black_countertop_right)
  )

  (:goal
    (and
      (isClean egg_light_brown_inside_microwave)
      (inReceptacle egg_light_brown_inside_microwave counter_brown_marble_surface)
    )
  )
)