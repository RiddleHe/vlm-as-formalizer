(define (problem examine_credit_card_by_lamp)
    (:domain put_task)
    (:objects
        agent1 - agent
        credit_card - object
        tall_lamp - object
        coffee_table - receptacle
    )
    (:init
        (atLocation agent1 coffee_table)
        (inReceptacle credit_card coffee_table)
        (isOn tall_lamp)
        (openable coffee_table)
        (opened coffee_table)
    )
    (:goal
        (and
            (holds agent1 credit_card)
            (atLocation agent1 tall_lamp)
        )
    )
)