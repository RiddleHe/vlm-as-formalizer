(define (problem put_bowl_card_on_glass_table)
  (:domain put_task)

  (:objects
    robot - agent

    ;; receptacles
    glass_table - receptacle
    bowl - receptacle
    dining_table - receptacle

    ;; objects
    credit_card - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)

    ;; object locations / containments from the scene
    (inReceptacle credit_card glass_table)

    ;; the bowl is currently on the dining table (modeled as being in/on that receptacle)
    (inReceptacle bowl dining_table)
  )

  (:goal
    (and
      ;; bowl with credit card in it on the glass table
      (inReceptacle credit_card bowl)
      (inReceptacle bowl glass_table)
    )
  )
)