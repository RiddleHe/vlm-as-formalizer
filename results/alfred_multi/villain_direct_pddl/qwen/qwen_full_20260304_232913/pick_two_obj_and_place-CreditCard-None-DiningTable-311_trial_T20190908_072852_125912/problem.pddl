(define (problem move_credit_cards)
    (:domain put_task)
    (:objects
        agent1 - agent
        tv_stand - receptacle
        table - receptacle
        credit_card1 - object
        credit_card2 - object
    )
    (:init
        (atLocation agent1 tv_stand)
        (inReceptacle credit_card1 tv_stand)
        (inReceptacle credit_card2 tv_stand)
        (openable tv_stand)
        (opened tv_stand)
    )
    (:goal
        (and
            (inReceptacle credit_card1 table)
            (inReceptacle credit_card2 table)
        )
    )
)