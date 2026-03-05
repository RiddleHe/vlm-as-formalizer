(define (problem put_bowl_with_credit_card_on_glass_table)
    (:domain put_task)
    (:objects
        agent - agent
        glass_table - receptacle
        dining_table - receptacle
        bowl - object
        credit_card - object
    )
    (:init
        (atLocation agent glass_table)
        (inReceptacle credit_card glass_table)
        (inReceptacle bowl dining_table)
    )
    (:goal (and
        (inReceptacle bowl glass_table)
        (inReceptacle credit_card bowl)
    ))
)