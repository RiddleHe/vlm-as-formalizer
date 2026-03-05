(define (problem move_credit_cards)
    (:domain put_task)
    (:objects
        agent1 - agent
        credit_card1 - object
        credit_card2 - object
        tv_stand - receptacle
        table - receptacle
        pen - object
    )
    (:init
        (atLocation agent1 tv_stand) ; Agent starts at the TV stand to pick up the cards
        (inReceptacle credit_card1 tv_stand)
        (inReceptacle credit_card2 tv_stand)
        (not (holdsAny agent1))
    )
    (:goal (and
        (inReceptacle credit_card1 table)
        (inReceptacle credit_card2 table)
    ))
)