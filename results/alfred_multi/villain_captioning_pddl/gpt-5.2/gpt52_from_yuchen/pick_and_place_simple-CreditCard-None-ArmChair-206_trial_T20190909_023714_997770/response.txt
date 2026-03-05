(define (problem move_credit_card_to_armchair)
  (:domain put_task)

  (:objects
    robot - agent
    credit_card - object
    armchair - receptacle
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts initially)

    ;; Object locations
    ;; Credit card is on the floor/carpet (not in any receptacle initially)
    (atLocation robot credit_card)

    ;; Armchair is a receptacle/surface for placing items; not openable
  )

  (:goal
    (and
      (inReceptacle credit_card armchair)
    )
  )
)