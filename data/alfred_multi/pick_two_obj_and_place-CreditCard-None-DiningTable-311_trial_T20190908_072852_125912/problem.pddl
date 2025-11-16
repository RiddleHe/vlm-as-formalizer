(define (problem alfred_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        CreditCard_2 - object
        CreditCard_1 - object
        Dresser_1 - receptacle
        DiningTable_1 - receptacle
        )
    (:init
        (inReceptacle CreditCard_2 Dresser_1)
        (inReceptacle CreditCard_1 Dresser_1)
    )
    (:goal (and
        (inReceptacle CreditCard_1 DiningTable_1)
        (inReceptacle CreditCard_1 DiningTable_1)
    ))
)