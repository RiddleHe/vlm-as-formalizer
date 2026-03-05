(define (problem put_task_cooked_egg_on_table)
  (:domain put_task)

  (:objects
    robot_agent - agent

    ;; receptacles
    round_wooden_table - receptacle
    tan_countertop_coffee_machine - receptacle
    black_coffee_mug - receptacle
    square_tan_bowl - receptacle
    blue_soap_dispenser_bottle - receptacle

    ;; special receptacles
    black_countertop_microwave_right - microwave
    stainless_kitchen_sink_basin - sink

    ;; objects
    green_sponge_rectangular - object
    metal_fork_on_table - object
    metal_butter_knife_on_table - object
    metal_spatula_on_counter_left - object
    red_tomato_on_table_center - object
    red_tomato_on_table_edge - object
    brown_egg_in_sink - object
  )

  (:init
    ;; no openable/opened receptacles observed
    ;; agent starts not at any location and holds nothing

    ;; containment relations from scene graph
    (inReceptacle black_coffee_mug tan_countertop_coffee_machine)
    (inReceptacle green_sponge_rectangular stainless_kitchen_sink_basin)
    (inReceptacle brown_egg_in_sink stainless_kitchen_sink_basin)

    (inReceptacle metal_fork_on_table round_wooden_table)
    (inReceptacle metal_butter_knife_on_table round_wooden_table)
    (inReceptacle red_tomato_on_table_center round_wooden_table)
    (inReceptacle red_tomato_on_table_edge round_wooden_table)
    (inReceptacle square_tan_bowl round_wooden_table)
    (inReceptacle blue_soap_dispenser_bottle round_wooden_table)
    (inReceptacle tan_countertop_coffee_machine round_wooden_table)
  )

  (:goal
    (and
      ;; "cooked" corresponds to heated in the microwave in this domain
      (isHot brown_egg_in_sink)
      (inReceptacle brown_egg_in_sink round_wooden_table)
    )
  )
)