(define (problem examine-credit-card-by-lamp)
  (:domain put_task)
  (:objects
    robot - agent
    wooden_coffee_table_rectangular - receptacle
    red_credit_card_on_table - object
    black_hair_tie_left_on_table - object
    black_hair_tie_right_on_table - object
    tall_floor_lamp_green_shade - object
  )
  (:init
    ;; robot starts not at any location and holding nothing
    (not (holdsAny robot))

    ;; objects on the coffee table
    (inReceptacle red_credit_card_on_table wooden_coffee_table_rectangular)
    (inReceptacle black_hair_tie_left_on_table wooden_coffee_table_rectangular)
    (inReceptacle black_hair_tie_right_on_table wooden_coffee_table_rectangular)
  )
  (:goal
    (and
      ;; to examine the credit card by the lamp, bring the card to the lamp's location
      (atLocation robot tall_floor_lamp_green_shade)
      (holds robot red_credit_card_on_table)
    )
  )
)