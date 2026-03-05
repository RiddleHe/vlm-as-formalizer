(define (problem move_credit_card_to_armchair)
  (:domain put_task)
  (:objects
    robot - agent
    armchair - receptacle
    desk - receptacle
    credit_card - object
  )
  (:init
    ;; robot initially not at any object's location (so no atLocation facts for robot)

    ;; receptacle relationships from the scene
    (inReceptacle credit_card desk)

    ;; allow armchair to function as a container/receptacle for placing the card
    ;; (no open/close behavior indicated for the armchair)
  )
  (:goal
    (and
      (inReceptacle credit_card armchair)
    )
  )
)