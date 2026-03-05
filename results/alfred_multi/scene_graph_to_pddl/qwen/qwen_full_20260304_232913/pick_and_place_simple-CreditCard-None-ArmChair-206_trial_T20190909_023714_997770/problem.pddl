(define (problem move_credit_card_to_armchair)
    (:domain put_task)
    (:objects
        agent1 - agent
        dark_blue_armchair - receptacle
        dark_wooden_table - receptacle
        credit_card - object
    )
    (:init
        (openable dark_blue_armchair)
        (openable dark_wooden_table)
        (inReceptacle credit_card dark_wooden_table)
        (atLocation agent1 dark_wooden_table)
    )
    (:goal (and (inReceptacle credit_card dark_blue_armchair)))
)