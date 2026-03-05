(define (problem put_task_pen_bowl_on_desk)
  (:domain put_task)

  (:objects
    robot_agent - agent

    microwave - microwave
    fridge - fridge
    sink - sink

    tall_wooden_shelving_unit_with_lower_shelf - receptacle
    white_desk_table - receptacle
    wooden_nightstand_top - receptacle
    left_metal_bowl_on_lower_shelf - receptacle
    right_metal_bowl_on_lower_shelf - receptacle
    bed_surface - receptacle

    silver_cd_on_lower_shelf - object
    black_laptop_on_desk - object
    black_office_chair - object
    black_table_lamp_on_nightstand - object
    round_alarm_clock_on_nightstand - object
    white_pen_on_nightstand - object
    orange_basketball_on_floor - object
    pair_of_brown_boots_on_floor - object
  )

  (:init
    ;; object placements (in receptacles)
    (inReceptacle silver_cd_on_lower_shelf tall_wooden_shelving_unit_with_lower_shelf)
    (inReceptacle silver_cd_on_lower_shelf right_metal_bowl_on_lower_shelf)
    (inReceptacle left_metal_bowl_on_lower_shelf tall_wooden_shelving_unit_with_lower_shelf)
    (inReceptacle right_metal_bowl_on_lower_shelf tall_wooden_shelving_unit_with_lower_shelf)
    (inReceptacle black_laptop_on_desk white_desk_table)
    (inReceptacle black_office_chair white_desk_table)
    (inReceptacle black_table_lamp_on_nightstand wooden_nightstand_top)
    (inReceptacle round_alarm_clock_on_nightstand wooden_nightstand_top)
    (inReceptacle white_pen_on_nightstand wooden_nightstand_top)
    (inReceptacle orange_basketball_on_floor tall_wooden_shelving_unit_with_lower_shelf)
    (inReceptacle pair_of_brown_boots_on_floor tall_wooden_shelving_unit_with_lower_shelf)
    (inReceptacle bed_surface tall_wooden_shelving_unit_with_lower_shelf)

    ;; states
    (isOn black_table_lamp_on_nightstand)
  )

  (:goal
    (and
      ;; pen is in a metal bowl, and that bowl is on the desk
      (inReceptacle white_pen_on_nightstand left_metal_bowl_on_lower_shelf)
      (inReceptacle left_metal_bowl_on_lower_shelf white_desk_table)
    )
  )
)