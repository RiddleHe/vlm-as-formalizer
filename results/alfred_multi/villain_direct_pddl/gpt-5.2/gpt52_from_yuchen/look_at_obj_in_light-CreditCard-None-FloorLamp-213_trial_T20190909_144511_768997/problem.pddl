(define (problem examine_card_by_lamp)
  (:domain put_task)
  (:objects
    robot - agent
    credit_card - object
    tall_lamp - object
    coffee_table - receptacle
  )
  (:init
    ;; receptacle property
    (openable coffee_table)

    ;; object locations / containment from the scene
    (inReceptacle credit_card coffee_table)

    ;; robot initially not at any object's location (per instruction)
  )
  (:goal
    (and
      ;; to "examine ... by the light", model as being at the lamp's location
      (atLocation robot tall_lamp)

      ;; and holding the credit card
      (holds robot credit_card)
    )
  )
)