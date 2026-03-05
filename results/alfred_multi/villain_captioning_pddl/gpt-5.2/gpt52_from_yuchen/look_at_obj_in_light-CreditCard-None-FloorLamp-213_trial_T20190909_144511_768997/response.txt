(define (problem examine-card-by-lamp)
  (:domain put_task)
  (:objects
    robot - agent
    credit_card_1 - object
    coffee_table_1 - object
    tall_lamp_1 - object
  )

  (:init
    ;; Agent initially not at any object's location and holds nothing
    ;; Credit card is on the coffee table (modeled as being "in" the table location)
    (inReceptacle credit_card_1 coffee_table_1)
  )

  (:goal
    (and
      ;; Have the lamp toggled (used as providing light)
      (isToggled tall_lamp_1)
      ;; Have the agent at the credit card location so it can be examined by the lamp light
      (atLocation robot credit_card_1)
    )
  )
)