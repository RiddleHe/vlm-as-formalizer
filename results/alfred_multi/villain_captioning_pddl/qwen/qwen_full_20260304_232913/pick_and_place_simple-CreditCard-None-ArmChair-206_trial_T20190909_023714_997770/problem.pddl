(define (problem move_credit_card_to_armchair)
    (:domain put_task)
    (:objects
        agent - agent
        credit_card - object
        armchair - receptacle
    )
    (:init
        (not (atLocation agent armchair))
        (not (holds agent credit_card))
        (not (holdsAny agent))
        (not (inReceptacle credit_card armchair))
        (not (openable armchair))  ; armchair is not openable
    )
    (:goal
        (and
            (inReceptacle credit_card armchair)
        )
    )
)