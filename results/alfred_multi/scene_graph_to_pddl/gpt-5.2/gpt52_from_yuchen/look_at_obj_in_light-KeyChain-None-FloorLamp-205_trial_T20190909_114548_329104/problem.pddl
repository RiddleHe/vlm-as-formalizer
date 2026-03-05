(define (problem look-at-keys-by-lamp)
  (:domain put_task)
  (:objects
    robot - agent

    clear_glass_dining_table_receptacle - receptacle

    black_open_laptop_on_table - object
    red_card_on_table - object
    gold_trophy_statue_left_on_black_base - object
    gold_trophy_statue_center_on_black_base - object
    gold_trophy_statue_top_on_black_base - object
    tall_table_lamp_with_white_shade - object
  )

  (:init
    ;; robot starts not at any object's location (no atLocation facts)

    ;; receptacle relations
    (inReceptacle black_open_laptop_on_table clear_glass_dining_table_receptacle)
    (inReceptacle red_card_on_table clear_glass_dining_table_receptacle)
    (inReceptacle gold_trophy_statue_left_on_black_base clear_glass_dining_table_receptacle)
    (inReceptacle gold_trophy_statue_center_on_black_base clear_glass_dining_table_receptacle)
    (inReceptacle gold_trophy_statue_top_on_black_base clear_glass_dining_table_receptacle)

    ;; lamp state
    (isOn tall_table_lamp_with_white_shade)
  )

  (:goal
    (and
      ;; interpret "keys" as the small red item on the table
      (atLocation robot red_card_on_table)
      ;; by the light of the lamp: be at the lamp, and the lamp is on
      (atLocation robot tall_table_lamp_with_white_shade)
      (isOn tall_table_lamp_with_white_shade)
    )
  )
)