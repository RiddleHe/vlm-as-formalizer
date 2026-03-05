(define (problem put_task_clean_mug_on_table)
  (:domain put_task)
  (:objects
    robot_agent - agent

    black_countertop_microwave_right - microwave
    tall_black_fridge_right - fridge
    stainless_double_sink_left_counter - sink

    silver_kitchen_knife_on_left_drainboard - knife

    wooden_countertop_left - receptacle
    black_stove_counter_unit_right - receptacle
    clear_glass_cup_left_of_microwave - receptacle
    green_glass_cup_on_wooden_table - receptacle

    green_sponge_on_left_drainboard - object
    green_sponge_in_sink_basin - object
    small_spoon_in_sink_basin - object
    copper_pepper_grinder_left_of_microwave - object
    two_brown_bread_loaves_on_counter - object
    small_black_pot_on_counter - object
  )

  (:init
    (openable black_countertop_microwave_right)
    (openable tall_black_fridge_right)

    (inReceptacle silver_kitchen_knife_on_left_drainboard stainless_double_sink_left_counter)
    (inReceptacle green_sponge_on_left_drainboard stainless_double_sink_left_counter)
    (inReceptacle small_spoon_in_sink_basin stainless_double_sink_left_counter)
    (inReceptacle green_sponge_in_sink_basin stainless_double_sink_left_counter)

    (inReceptacle black_countertop_microwave_right black_stove_counter_unit_right)
    (inReceptacle copper_pepper_grinder_left_of_microwave black_stove_counter_unit_right)
    (inReceptacle clear_glass_cup_left_of_microwave black_stove_counter_unit_right)

    (inReceptacle green_glass_cup_on_wooden_table wooden_countertop_left)
    (inReceptacle two_brown_bread_loaves_on_counter wooden_countertop_left)
    (inReceptacle small_black_pot_on_counter wooden_countertop_left)

    (atLocation robot_agent wooden_countertop_left)
  )

  (:goal
    (and
      (isClean clear_glass_cup_left_of_microwave)
      (inReceptacle clear_glass_cup_left_of_microwave wooden_countertop_left)
    )
  )
)